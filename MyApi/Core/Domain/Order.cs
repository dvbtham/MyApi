using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyApi.Core.Domain
{
    [Table("Orders")]
    public class Order
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }

        public string UserId { get; set; }

        [ForeignKey("UserId")]
        public ApplicationUser User { get; set; }

        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerPhone { get; set; }

        public DateTime OrderDate { get; set; }
        public DateTime ShipDate { get; set; }
        
        public bool Status { get; set; }

        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}