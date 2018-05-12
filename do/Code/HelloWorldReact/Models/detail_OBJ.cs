


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
namespace IS.uni
{
    public class detail_OBJ
    {
        public class BusinessObjectID
        {
            public BusinessObjectID() { }
            private System.Int32 _CODE;

            public BusinessObjectID(System.Int32 mCODE)
            {
                _CODE = mCODE;
            }

            public System.Int32 CODE
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

        public detail_OBJ()
        {
            _ID = new BusinessObjectID();
        }

        public detail_OBJ(BusinessObjectID id)
        {
            _ID = new BusinessObjectID();
            _ID = id;
        }

        public virtual int code
        {
            get;
            set;
        }
        //[Display(Name = "Mã sinh viên")]
        //public virtual System.String code
        //{
        //    get;
        //    set;
        //}
        [Display(Name = "Họ và tên")]
        public virtual System.String name
        {
            get;
            set;
        }
        [Display(Name = "Ngày sinh ")]
        public virtual System.DateTime dateofbirth
        {
            get;
            set;
        }
        [Display(Name = "Giới tính ")]
        public virtual System.Int16 sex
        {
            get;
            set;
        }
        [Display(Name = "Khoa")]
        public virtual System.String gradename
        {
            get;
            set;
        }
        [Display(Name = "Chuyên ngành ")]
        public virtual System.String educationspecializename
        {
            get;
            set;
        }
        [Display(Name = "Lớp")]
        public virtual System.String classname
        {
            get;
            set;
        }
        [Display(Name = "Ngày sinh ")]
        public virtual System.String educationlevelname
        {
            get;
            set;
        }
        [Display(Name = "Hình thức")]
        public virtual System.String educationtypename
        {
            get;
            set;
        }
        [Display(Name = "Tổng tín chỉ ")]
        public virtual System.String TongTinChi
        {
            get;
            set;
        }
        [Display(Name = "Điểm trung bình")]
        public virtual System.String DiemTrungBinh
        {
            get;
            set;
        }
        [Display(Name = "Hạnh kiểm")]
        public virtual System.String conductname
        {
            get;
            set;
        }
        [Display(Name = "Số tín chỉ quốc phòng ")]
        public virtual System.String SoTinQuocPhong
        {
            get;
            set;
        }
        [Display(Name = "Số tín chỉ thể dục ")]
        public virtual System.String SoTinTheDuc
        {
            get;
            set;
        }
        [Display(Name = "Số tín chỉ thể dục tự chọn ")]
        public virtual System.String SOTinTheDucTuChon
        {
            get;
            set;
        }
        [Display(Name = "Số tín chỉ tự chọn cơ sở ngành ")]
        public virtual System.String SoTinTuChonCoSoNganh
        {
            get;
            set;
        }
        [Display(Name = "Số tín tự chọn chuyên ngành ")]
        public virtual System.String SoTinTuChonChuyenNganh
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

