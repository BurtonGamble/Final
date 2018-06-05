using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Person
/// </summary>

[Serializable]
public class Person
{
    public string FirstName, LastName, LoginName;
    public int StudentId;

    public Person(string FirstName, string LastName)
    {
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.StudentId = 0;
        this.LoginName = "";
    }

    public Person(string Login, int Id)
    {
        this.FirstName = "";
        this.LastName = "";
        this.StudentId = Id;
        this.LoginName = Login;
    }
}