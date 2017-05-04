public with sharing class UserInfoList {

      public string sDepartment{get;set;}
      public string sCurrentUserDepartment
      {
            get{return UserInfoListHelper.FindDepartment(UserInfo.getUserId());}
            set;
      }
      public List<User> CurrentListofUsers
      {
            get{return UserInfoListHelper.UserList( UserInfoListHelper.FindDepartment(sCurrentUserDepartment, sDepartment));}
            set;
      }
      public integer iUserCount
      {
            get{return CurrentListofUsers.size();}
            set;
      }
      public List<selectOption> lstDepartmentOptions
      {
            get{return UserInfoListHelper.DepartmentKeys();}
            set{lstDepartmentOptions = value;}
      }
            
      public pageReference SwitchList()
      {
            
                  sDepartment = sCurrentUserDepartment;
           
            return null;
      }
}