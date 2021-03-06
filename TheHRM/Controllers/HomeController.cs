﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TheHRM.Models;

namespace TheHRM.Controllers
{
    public class HomeController : Controller
    {

        private ModelHRMContainer db = new ModelHRMContainer();


        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();


        }

        public ActionResult EmployeeLogIn()
        {
            ViewBag.Message = "Employee LogIn";

            return View();
        }

        public ActionResult Employees()
        {
            return View(db.Employees.ToList());
        }

        public ActionResult Leave()
        {
            TheHRM.Models.Leave leave=new Leave();
            List<TheHRM.Models.Employee> employee = new List<Employee>();

            ViewData["EmpID"] = new SelectList(employee, "EmpID", "FName");
            ViewData["FName"] = new SelectList(employee, "FName", "EmpID");
            return View(leave);
        }

        public ActionResult ViewLeave()
        {

            ViewBag.Message = "Leaves";

            return View(db.Employees.ToList());


        }
    }
}