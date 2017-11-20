using System;
using System.ComponentModel.DataAnnotations;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Web.Mvc;
using AutoMapper;
using MyApi.Areas.Admin.Controllers;

namespace MyApi.Core.ViewModel
{
    public class ProductSaveViewModel
    {
        public long Id { get; set; }
        
        [Required]
        public string Name { get; set; }

        [Required]
        public decimal Price { get; set; }

        [Required]
        [Display(Name = "Original Price")]
        public decimal OriginalPrice { get; set; }

        [Required]
        public string Image { get; set; }

        [Required]
        public string Description { get; set; }

        public DateTime CreateDate { get; set; } = DateTime.Now;

        [Required]
        public int Quantity { get; set; } = 0;

        public bool Status { get; set; } = true;

        [IgnoreMap]
        public string Heading { get; set; }

        [IgnoreMap]
        public string Action
        {
            get
            {
                Expression<Func<ProductsController, Task<ActionResult>>> update = (c => c.Update(this));
                Expression<Func<ProductsController, Task<ActionResult>>> create = (c => c.Create(this));
                var action = (Id != 0) ? update : create;
                return (action.Body as MethodCallExpression)?.Method.Name;
            }
        }

    }
    public class ProductViewModel
    {
        public long Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public decimal Price { get; set; }

        [Required]
        [Display(Name = "Original Price")]
        public decimal OriginalPrice { get; set; }

        [Required]
        public string Image { get; set; }

        [Required]
        public string Description { get; set; }

        public DateTime CreateDate { get; set; } = DateTime.Now;

        [Required]
        public int Quantity { get; set; } = 0;

        public bool Status { get; set; } = true;
        
    }
}