﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopManageProject.Models;

namespace ShopManageProject.Controllers
{
    public class UsersController : Controller
    {
        private ShopManageDBEntities db = new ShopManageDBEntities();

        // GET: Users
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.UserGroup);
            return View(users.ToList());
        }

        // GET: Users/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            if (Session["UserID"] != null&&int.Parse(Session["UserID"].ToString()) == id)
            {
               return View(users);
            }
            return RedirectToAction("Login", "Login");
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            ViewBag.GroupId = new SelectList(db.UserGroup, "GroupId", "Name");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,UserName,Password,ConfirmPassword,GroupId,Name,Address,Email,Phone,Status")] Users users)
        {
            if (ModelState.IsValid)
            {
                users.Name = users.Name.Trim();
                users.Password = users.Password.Trim();
                users.CreateDate = DateTime.Now;
                users.GroupId = "12345";
                db.Users.Add(users);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.GroupId = new SelectList(db.UserGroup, "GroupId", "Name", users.GroupId);
            return View(users);
        }

        // GET: Users/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            ViewBag.GroupId = new SelectList(db.UserGroup, "GroupId", "Name", users.GroupId);
            return View(users);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,UserName,Password,,ConfirmPassword,GroupId,Name,Address,Email,Phone,CreateDate,Status")] Users users)
        {
            if (ModelState.IsValid)
            {
                users.CreateDate = DateTime.Now;
                users.GroupId = "12345";
                db.Entry(users).State = EntityState.Modified;
                db.SaveChanges();
                if(Session["GroupID"] == null || !Session["GroupID"].ToString().Equals("11111"))
                {
                    return RedirectToAction("ProductList", "Admin");
                }
                return RedirectToAction("Index","Products");
            }
            ViewBag.GroupId = new SelectList(db.UserGroup, "GroupId", "Name", users.GroupId);
            return View(users);
        }

        //// GET: Users/Delete/5
        //public ActionResult Delete(long? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Users users = db.Users.Find(id);
        //    if (users == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(users);
        //}

        //// POST: Users/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(long id)
        //{
        //    Users users = db.Users.Find(id);
        //    db.Users.Remove(users);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
