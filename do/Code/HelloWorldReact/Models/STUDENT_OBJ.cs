﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
namespace IS.uni
{
    public class STUDENT_OBJ
    {

        public class BusinessObjectID
        {
            public BusinessObjectID() { }
            private System.String _CODE;

            public BusinessObjectID(System.String mCODE)
            {
                _CODE = mCODE;

            }

            public System.String CODE
            {
                get { return _CODE; }
                set { _CODE = value; }
            }


            public override bool Equals(object obj)
            {
                if (obj == this) return true;
                if (obj == null) return false;

                BusinessObjectID that = obj as BusinessObjectID;
                if (that == null)
                {
                    return false;
                }
                else
                {
                    if (this.CODE != that.CODE) return false;

                    return true;
                }

            }


            public override int GetHashCode()
            {
                return CODE.GetHashCode();
            }

        }
        public BusinessObjectID _ID;
        //main object
        protected string _codeP = "{yyMMdd}{CCCC}";
        protected string _codePattern
        {
            get { return _codeP; }
            set { _codeP = value; }
        }

        //##fieldList##
        public static System.String pre() { return "PRE"; }
        public static System.String suf() { return "SUF"; }

        public STUDENT_OBJ()
        {
            _ID = new BusinessObjectID();
        }

        public STUDENT_OBJ(BusinessObjectID id)
        {
            _ID = new BusinessObjectID();
            _ID = id;
        }

        [Display(Name = "Mã")]
        public virtual System.String CODE
        {
            get;
            set;
        }
       
        [Display(Name = "Tên")]
        public virtual System.String NAME
        {
            get;
            set;
        }
      
        public virtual System.DateTime DATEOFBIRTH
        {
            get;
            set;
        }
        public virtual System.Int16 SEX
        {
            get;
            set;
        }
        public virtual System.String EMAIL
        {
            get;
            set;
        }
        public virtual System.String PHONE
        {
            get;
            set;
        }
        public virtual System.String FOLK
        {
            get;
            set;
        }
        public virtual System.String CLASSCODE
        {
            get;
            set;
        }
        public virtual System.String EDUCATIONSPECIALIZECODE
        {
            get;
            set;
        }
        public virtual System.String GRADECODE
        {
            get;
            set;
        }

        public override int GetHashCode()
        {
            return _ID.GetHashCode();
        }
    }
}