﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;
using PagedList;
namespace Model.Dao
{
    public class UserDAO
    {
        OnlineShopDbContext db = null;
        public UserDAO()
        {
            db = new OnlineShopDbContext();
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            try
            {
                db.SaveChanges();
            } catch (Exception e)
            {
                string ee = e.Message;
            }
            
            return entity.ID;
        }
        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);
                user.Name = entity.Name;
                if (string.IsNullOrEmpty(entity.Password))
                {
                    user.Password = entity.Password;
                }
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.ModifiedBy = entity.ModifiedBy;
                user.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }catch(Exception e)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            } catch (Exception e)
            {
                return false;
            }
            
        }
        public User ViewDetail(int id)
        {
            return db.Users.Find(id);
        }
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<User> model= db.Users;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Username.Contains(searchString) || x.Name.Contains(searchString));
            }
            return model.
                    OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
        public int Login(string username, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.Username == username && x.Type == "Admin");

            if (result == null)
            {
                return 0;
            }else
            {
                if (result.Status == false)
                {
                    return -1;
                }else
                {
                    if (result.Password == password)
                    {
                        return 1;
                    }else
                    {
                        return -2;
                    }
                }
            }
        }
        public int LoginNormal(string username, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.Username == username && x.Type == null);

            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                {
                    return -1;
                }
                else
                {
                    if (result.Password == password)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }
        }
        public User GetByID(string username)
        {
            return db.Users.SingleOrDefault(x => x.Username==username);
        }
        public bool ChangStatus(long id)
        {
            var user = db.Users.Find(id);
            user.Status = !user.Status;

            return !user.Status;
        }
        public bool CheckUsername(string username)
        {
            return db.Users.Count(x => x.Username == username) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
    }
}
