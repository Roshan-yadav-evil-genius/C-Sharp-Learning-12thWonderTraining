//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CSharpConcepts.Concepts.DatabaseInteraction.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class BATTLEHISTORY
    {
        public int ID { get; set; }
        public int PID { get; set; }
        public int GID { get; set; }
        public Nullable<int> SCORE { get; set; }
        public Nullable<int> WITHP { get; set; }
    
        public virtual PLAYER PLAYER { get; set; }
        public virtual GAME GAME { get; set; }
        public virtual PLAYER PLAYER1 { get; set; }
    }
}
