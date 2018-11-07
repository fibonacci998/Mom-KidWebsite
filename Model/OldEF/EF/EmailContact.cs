namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EmailContact")]
    public partial class EmailContact
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string Email { get; set; }
    }
}
