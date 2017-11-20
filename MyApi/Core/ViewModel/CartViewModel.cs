using System.Collections.Generic;

namespace MyApi.Core.ViewModel
{
    public class CartViewModel
    {
        public long ProductId { get; set; }

        public ProductViewModel Product { get; set; }

        public int Quantity { get; set; }

        public IList<ProductViewModel> ListProducts { get; set; }
    }
}