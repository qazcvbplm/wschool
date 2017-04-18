package com.wschool.serviceImple;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.ResultSet;
import com.wschool.Dao.PictrueDao;
import com.wschool.Dao.ProductDao;
import com.wschool.entity.Pictrue;
import com.wschool.entity.Product;
import com.wschool.service.ProductServiceDao;
import com.wschool.util.FileUp;
import com.wschool.util.Result;

@Component
public class ProductServiceDaoImple implements ProductServiceDao{
	@Autowired
	private ProductDao productDao;
	@Autowired
	private PictrueDao pictrueDao;


	@Override
	public List<Product> findbyclassid(int classesid) {
		return productDao.findbyclassid(classesid);
	}

	@Override
	@Transactional
	public int addproduct(Product p, MultipartFile file, HttpServletRequest req) {
		Pictrue pic=new Pictrue();
		pic.setUrl(FileUp.UpFile(file, req, "upload"));
		try {
			pictrueDao.add(pic);
			p.setImage(pic.getId());
			if(p.getType().equals("on"))
				p.setType("1");
			else
				p.setType("0");
			productDao.add(p);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return Result.SUCCESS;
	}

	@Override
	public Product findbyid(int id) {
		return productDao.findbyid(id);
	}

	@Transactional
	@Override
	public int update(Product p, MultipartFile file,HttpServletRequest req) {
		int rs=Result.ERROR;
		if(!file.isEmpty())
		{
			Pictrue pic=new Pictrue();
			String url;
			if((url=FileUp.UpFile(file, req, "upload")).equals(Result.ERROR+""))
			{
				req.setAttribute("error", "图像不够清晰请上传大于1200万像素的图片");
				return Result.ERROR;
			}
			try {
				pic.setUrl(url);
				pictrueDao.add(pic);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException();
			}
			if(pic.getId()==Result.ERROR)
				return Result.ERROR;
			else
				p.setImage(pic.getId());
		}
		if(p.getType().equals("on"))
			p.setType("1");
		else
			p.setType("0");
		try {
			rs=productDao.update(p);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		return rs;
	}

	@Override
	public int deleteproductbyid(int id) {
		int rs=Result.SUCCESS;
		try {
			productDao.deletebyid(id);
		} catch (Exception e) {
			rs=Result.ERROR;
			e.printStackTrace();
		}
		return rs;
	}

}
