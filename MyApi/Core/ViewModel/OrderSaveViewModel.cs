using System;
using MyApi.Core.Domain;

namespace MyApi.Core.ViewModel
{
    public class OrderSaveViewModel
    {
        public long Id { get; set; }

        public string UserId { get; set; }
        
        public ApplicationUser User { get; set; }

        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerPhone { get; set; }

        public DateTime OrderDate { get; set; }
        public DateTime ShipDate { get; set; }


        public bool Status { get; set; }
    }
}