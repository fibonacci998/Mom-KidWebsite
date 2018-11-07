﻿using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Model.Dao
{
    public class ProductDAO
    {
        OnlineShopDbContext db = null;
        public ProductDAO()
        {
            db = new OnlineShopDbContext();
        }

        public List<Product> ListNewProduct(int top)
        {
            return db.Products.OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }
        public List<Product> ListRelatedProduct(long id)
        {
            var product = db.Products.Find(id);
            return db.Products.Where(x => x.ID!=id && x.CategoryID==product.CategoryID).Take(4).ToList();
        }

        public List<Product> listByCategoryId(long categoryId)
        {
            return db.Products.Where(x => x.CategoryID == categoryId).ToList();
        }

        public List<Product> ListHotProduct(int top)
        {
            return db.Products.Where(x => x.TopHot == true).OrderByDescending(y=>y.CreatedDate).Take(top).ToList();
        }
        public bool Insert(Product product)
        {
            product.CreatedDate = DateTime.Now;
            db.Products.Add(product);
            db.SaveChanges();
            return true;
        }

        public IEnumerable<Product> listAllPaging(int page, int pageSize)
        {
            return db.Products.OrderByDescending(x=>x.ID).ToPagedList(page,pageSize);
        }
        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }
        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.ID);
                if (!string.IsNullOrEmpty(entity.Name)) product.Name = entity.Name;
                if (!string.IsNullOrEmpty(entity.Description)) product.Description = entity.Description;
                if (!string.IsNullOrEmpty(entity.Image)) product.Image = entity.Image;
                //if (string.IsNullOrEmpty(entity.CategoryID)) 
                product.CategoryID = entity.CategoryID;
                if (!string.IsNullOrEmpty(entity.Detail)) product.Detail = entity.Detail;
                //if (string.IsNullOrEmpty(entity.TopHot)) 
                product.TopHot = entity.TopHot;
                //if (string.IsNullOrEmpty(entity.Status)) 
                product.Status = entity.Status;
                //if (string.IsNullOrEmpty(entity.Quantity))
                product.Quantity = entity.Quantity;
                //if (string.IsNullOrEmpty(entity.Price))
                product.Price = entity.Price;
                product.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var product = db.Products.Find(id);
                db.Products.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }

        }
    }
}
