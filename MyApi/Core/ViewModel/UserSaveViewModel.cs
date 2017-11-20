using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web.Mvc;
using AutoMapper;
using MyApi.Areas.Admin.Controllers;
using MyApi.Core.Domain;

namespace MyApi.Core.ViewModel
{
    public class UserSaveViewModel
    {
        public string Id { get; set; }

        public string Username { get; set; }

        public string Password { get; set; }

        public string Fullname { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }

        public DateTime CreateDate { get; set; }

        public bool Status { get; set; }

        [Display(Name = "Store")]
        public int StoreId { get; set; }

        public Store Store { get; set; }

        public List<string> Roles { get; set; }

        [IgnoreMap]
        public string Heading { get; set; }

        [IgnoreMap]
        public SelectList StoreList { get; set; }

        [IgnoreMap]
        public string Action
        {
            get
            {
                Expression<Func<UsersController, Task<ActionResult>>> update = (c => c.Update(this));
                Expression<Func<UsersController, Task<ActionResult>>> create = (c => c.Create(this));
                var action = !string.IsNullOrEmpty(Id) ? update : create;
                return (action.Body as MethodCallExpression)?.Method.Name;
            }
        }
    }

    public class UserViewModel
    {
        public string Id { get; set; }

        public string Fullname { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }

        public DateTime CreateDate { get; set; }

        public bool Status { get; set; }

        public int StoreId { get; set; }

        public Store Store { get; set; }
        
    }
}