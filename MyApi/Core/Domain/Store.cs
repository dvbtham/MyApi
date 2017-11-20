using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyApi.Core.Domain
{
    [Table("Stores")]
    public class Store
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [StringLength(256)]
        public string Name { get; set; }

        public virtual IList<ApplicationUser> Users { get; set; } = new List<ApplicationUser>();
    }
}