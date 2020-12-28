package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.beans.Product;
//import com.beans.Product_order;
import com.beans.User;
import com.beans.dogs;
import com.model.DB;

public class Controller extends HttpServlet {
	
	private Connection con;
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();
	ArrayList<Product> list2 = new ArrayList<>();
	ArrayList<dogs> list3 = new ArrayList<>();
	ArrayList<Product> list4 = new ArrayList<>();
	
	static ArrayList<String> cartlist = new ArrayList<>();
	static ArrayList<String> cartlist2 = new ArrayList<>();
	static ArrayList<String> cartlist3 = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	HttpSession session;

	private void dbConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "melvin");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		if (page == null || page.equals("index")) {

			DB db = new DB();
			try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			session.setAttribute("list", list);

			request.getRequestDispatcher("main.jsp").forward(request, response);
		} else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");
		if (page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
		
		//orderrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
		if(page.equals("order")) {
			list4.clear();
		
			try {
				session = request.getSession();
				String user = (session.getAttribute("username")).toString();
				
				dbConnect();
				String sql = "Select * from ORDERS where USERNAME=?";
				
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, user);
				
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					
					String name= rs.getString("name");
					String DATE_OF_ORDER= rs.getString("DATE_OF_ORDER");
					String price= rs.getString("price");
					String STATUs= rs.getString("STATUS");
					String image= rs.getString("image");
					
					Product pe = new Product();
					pe.setDATE_OF_ORDER(DATE_OF_ORDER);
				
				pe.setSTATUS(STATUs);
					pe.setImage(image);
					pe.setName(name);
					pe.setPrice(price);
					list4.add(pe);
					pe=null;
					
				}
				
				dbClose();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			session = request.getSession();
			session.setAttribute("cartlist2", cartlist2);
			session.setAttribute("list4", list4);
				request.getRequestDispatcher("order.jsp").forward(request, response);
				
			
			
			
			
			
		
		}
		
		if (page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}

		if (page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");

			if (password_1.equals(password_2)) {

				User user = new User();
				user.setAddress(address);
				user.setEmail(email);
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password_1);

				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				request.setAttribute("username", username);
				request.setAttribute("msg", "Account created successfully, Please Login!");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "The two passwords do not match");
				request.setAttribute("name", name);
				request.setAttribute("address", address);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}

		}

		if (page.equals("Dictionary")) {
			request.getRequestDispatcher("doginfo.jsp").forward(request, response);
		}
		if (page.equals("buy-now")) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
		if (page.equals("login-form")) {

			String username = request.getParameter("username");
			String password = request.getParameter("password");

			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username, password);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (status) {
				session = request.getSession();
				session.setAttribute("session", session);

				try {
					userList = db.fetchUser();

				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("address", user.fetchadd(userList, username));
				session.setAttribute("email", user.fetchemail(userList, username));
				session.setAttribute("name", user.fetchname(userList, username));
				session.setAttribute("username", username);
				// user.setName(username);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		}

		if (page.equals("logout")) {
			session = request.getSession();
			session.invalidate();

			session = request.getSession();
			cartlist.clear();
			session.setAttribute("cartlist", cartlist);
			session.setAttribute("list", list);

			request.getRequestDispatcher("index.jsp").forward(request, response);
		}

		if (page.equals("mobiles") || page.equals("laptops") || page.equals("clothing") || page.equals("home-decor")
				|| page.equals("all-products")) {
			DB db = new DB();
			try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("list", list);

			if (page.equals("mobiles"))
				request.getRequestDispatcher("fishes.jsp").forward(request, response);
			if (page.equals("laptops"))
				request.getRequestDispatcher("cats.jsp").forward(request, response);
			if (page.equals("clothing"))
				request.getRequestDispatcher("dogs.jsp").forward(request, response);
			if (page.equals("home-decor"))
				request.getRequestDispatcher("birds.jsp").forward(request, response);
			if (page.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
		}

		if (page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}

		
		
		
		
		
if (page.equals("dog-info")) {
			
	session = request.getSession();

	session.removeAttribute("list3");
	list3.clear();
	//session.invalidate();
	
	
			String size=request.getParameter("size");
			String origin=request.getParameter("origin");
			String colour=request.getParameter("colour");
			String sql2;
				try {
				
				
					dbConnect();
					if(size!=null)
					{
					sql2 = "Select * from DOGINFO where BREEDSIZE=?";
					PreparedStatement st2 = con.prepareStatement(sql2);
					st2.setString(1, size);
					ResultSet rs2 = st2.executeQuery();
					while(rs2.next()) {
						String BREEDPIC=rs2.getString("BREEDPIC");
						String BREEDNAME= rs2.getString("BREEDNAME");
						String BREEDORIGIN= rs2.getString("BREEDORIGIN");
						String BREEDPOP= rs2.getString("BREEDPOP");
						String BREEDINFO= rs2.getString("BREEDINFO");
						
						dogs pes = new dogs();
						pes.setBREEDPIC(BREEDPIC);
					
						pes.setBREEDNAME(BREEDNAME);
						pes.setBREEDORIGIN(BREEDORIGIN);
						pes.setBREEDPOP(BREEDPOP);
						pes.setBREEDINFO(BREEDINFO);
						list3.add(pes);
						pes=null;
					}
					}
					else
						if(origin!=null)
						{
						sql2 = "Select * from DOGINFO where BREEDORIGIN=?";
						PreparedStatement st2 = con.prepareStatement(sql2);
						st2.setString(1, origin);
						ResultSet rs2 = st2.executeQuery();
						while(rs2.next()) {
							String BREEDPIC=rs2.getString("BREEDPIC");
							String BREEDNAME= rs2.getString("BREEDNAME");
							String BREEDORIGIN= rs2.getString("BREEDORIGIN");
							String BREEDPOP= rs2.getString("BREEDPOP");
							String BREEDINFO= rs2.getString("BREEDINFO");
							
							dogs pes = new dogs();
							pes.setBREEDPIC(BREEDPIC);
						
							pes.setBREEDNAME(BREEDNAME);
							pes.setBREEDORIGIN(BREEDORIGIN);
							pes.setBREEDPOP(BREEDPOP);
							pes.setBREEDINFO(BREEDINFO);
							list3.add(pes);
							pes=null;
						}
						}
						else if(colour!=null)
						{
						sql2 = "Select * from DOGINFO where BREEDCOLOUR=?";
						PreparedStatement st2 = con.prepareStatement(sql2);
						st2.setString(1, colour);
						ResultSet rs2 = st2.executeQuery();
						while(rs2.next()) {
							String BREEDPIC=rs2.getString("BREEDPIC");
							String BREEDNAME= rs2.getString("BREEDNAME");
							String BREEDORIGIN= rs2.getString("BREEDORIGIN");
							String BREEDPOP= rs2.getString("BREEDPOP");
							String BREEDINFO= rs2.getString("BREEDINFO");
							
							dogs pes = new dogs();
							pes.setBREEDPIC(BREEDPIC);
						
							pes.setBREEDNAME(BREEDNAME);
							pes.setBREEDORIGIN(BREEDORIGIN);
							pes.setBREEDPOP(BREEDPOP);
							pes.setBREEDINFO(BREEDINFO);
							list3.add(pes);
							pes=null;
						}
							
						}
						else
						{
							JOptionPane.showMessageDialog(null, "Please select an option to Search", "Info",
									JOptionPane.INFORMATION_MESSAGE);
						}
					
					
						
					
					
					
					dbClose();
					
				} catch (Exception e) {
					
					System.out.print(e);
				}

				
					session = request.getSession();
					session.setAttribute("list3", list3);
				
					request.getRequestDispatcher("doginfo.jsp").forward(request, response);
					
			}
			
			
			
	
		
		
		
		if (page.equals("dogs")) {
			
			session.removeAttribute("list3");
			list3.clear();
			
				
				try {
				
					
					dbConnect();
					String sql1 = "Select * from DOGINFO ";
					
					PreparedStatement st1 = con.prepareStatement(sql1);
				
					ResultSet rs1 = st1.executeQuery();
					while(rs1.next()) {
						String BREEDPIC=rs1.getString("BREEDPIC");
						String BREEDNAME= rs1.getString("BREEDNAME");
						String BREEDORIGIN= rs1.getString("BREEDORIGIN");
						String BREEDPOP= rs1.getString("BREEDPOP");
						String BREEDINFO= rs1.getString("BREEDINFO");
						
						dogs pes = new dogs();
						pes.setBREEDPIC(BREEDPIC);
					
						pes.setBREEDNAME(BREEDNAME);
						pes.setBREEDORIGIN(BREEDORIGIN);
						pes.setBREEDPOP(BREEDPOP);
						pes.setBREEDINFO(BREEDINFO);
						list3.add(pes);
						pes=null;
						
					}
					
					dbClose();
				} catch (SQLException e) {
					
					System.out.print(e);
				}

				
				session = request.getSession();
				session.setAttribute("cartlist3", cartlist3);
				session.setAttribute("list3", list3);
					request.getRequestDispatcher("doginfo.jsp").forward(request, response);
				
		//	request.getRequestDispatcher("doginfo.jsp").forward(request, response);
		}
		
		
		if (page.equals("dog-details")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			System.out.println(id);
			System.out.println(action);
			
		}
		
		
		
		if (page.equals("addtocart")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			
			int quantity = Integer. parseInt(request. getParameter("quantity"));
			int count = 0;
			Product p = new Product();
			//boolean check = p.check(cartlist, id);
		
			
if(quantity==0)
{
	JOptionPane.showMessageDialog(null, "Sorry, Out of Stock", "Info",
			JOptionPane.INFORMATION_MESSAGE);
	request.getRequestDispatcher("index.jsp").forward(request, response);
}
else
{
	for(int i = 0; i < cartlist.size(); i++)
    {
		
		System.out.println();
		if(((cartlist.get(i)).toString()).compareTo(id)==0)
		{
			count++;
		}
       
        
    }
	
	if(count==quantity)
	

		
			{
				JOptionPane.showMessageDialog(null, "Sorry, out of limits", "Info",
						JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else {
				cartlist.add(id);
				System.out.print("id="+id);
				JOptionPane.showMessageDialog(null, "Product successfully added to Cart", "Info",
						JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
}
			if (action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if (action.equals("allproducts"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if (action.equals("clothing"))
				request.getRequestDispatcher("dogs.jsp").forward(request, response);
			if (action.equals("home-decor"))
				request.getRequestDispatcher("birds.jsp").forward(request, response);
			if (action.equals("laptops"))
				request.getRequestDispatcher("cats.jsp").forward(request, response);
			if (action.equals("mobiles"))
				request.getRequestDispatcher("fishes.jsp").forward(request, response);
		}
		
		
		
		
		if (page.equals("payment")) {
			session = request.getSession();
			try
			{
				
				
			if ((session.getAttribute("username").toString())==null)

			{
				JOptionPane.showMessageDialog(null, "Please Login to continue", "Info",
						JOptionPane.INFORMATION_MESSAGE);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			} 
			else 
			{
				
				if(cartlist.size()==0)
				{
					JOptionPane.showMessageDialog(null, "Please add an item to cart", "Info",
							JOptionPane.INFORMATION_MESSAGE);
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else
				{
			
			request.getRequestDispatcher("payment.jsp").forward(request, response);
				}
			}
			}catch(Exception e)
			{
				JOptionPane.showMessageDialog(null, "Please Login to continue", "Info",
						JOptionPane.INFORMATION_MESSAGE);
		request.getRequestDispatcher("login.jsp").forward(request, response);
		}
			
		
		
		}
		
		

		if (page.equals("payment-form")) {
			
			try
			{
			String card = request.getParameter("card");
			String cvv = request.getParameter("cvv");
			
			dbConnect();
			String sql = "Select * from bank";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String card2 = rs.getString("card");
				String cvv2 = rs.getString("cvv");
				
				
			
				if(card.compareTo(card2)==0)
				{
					
					
						
					session = request.getSession();
					String user = (session.getAttribute("username")).toString();

					// User user=new User();
					try {

						for (int i = 0; i < cartlist.size(); i++) {
							// System.out.println(cartlist.get(i));
							long millis = System.currentTimeMillis();
							java.sql.Date date = new java.sql.Date(millis);
							
							dbConnect();
							
							
							//list.clear();
							
							
							String sql4 = "Select * from product where ID=?";
							PreparedStatement st4 = con.prepareStatement(sql4);
							st4.setString(1,cartlist.get(i));
							ResultSet rs4 = st4.executeQuery();
							while(rs4.next()) {
								int id=rs4.getInt("id");
								String name= rs4.getString("name");
								String category= rs4.getString("category");
								String price= rs4.getString("price");
								String featured= rs4.getString("featured");
								String image= rs4.getString("image");
								int QUANTITY= rs4.getInt("QUANTITY");
								
								Product pn = new Product();
								pn.setCategory(category);
								pn.setFeatured(featured);
								pn.setId(id);
								pn.setImage(image);
								pn.setName(name);
								pn.setPrice(price);
								pn.setQUANTITY(QUANTITY);
								list4.add(pn);
								
								
								
								String sqll = "Insert into Orders(ID,ITEMID,DATE_OF_ORDER,PRICE,IMAGE,USERNAME,NAME) values(?,?,?,?,?,?,?)";
								PreparedStatement stt = con.prepareStatement(sqll);
								stt.setString(1, "order123");
								stt.setString(2,cartlist.get(i) );
								stt.setString(3, date.toString());
								stt.setString(4,pn.getPrice() );
								stt.setString(5, pn.getImage());
								stt.setString(6, user);
								stt.setString(7, pn.getName());

								stt.executeUpdate();
								
								//list.clear();
							}
							
							
							
							
							
							
							
							
							
							
							
							String sql3 = "update product set QUANTITY=QUANTITY-1 where id=?";
							PreparedStatement st3 = con.prepareStatement(sql3);
		
							st3.setString(1, cartlist.get(i));
							st3.executeUpdate();
							dbClose();

							//request.getRequestDispatcher("success.jsp").forward(request, response);


						}

					} catch (Exception e) {
						System.out.print(e);
					}

			

					
					  session = request.getSession(); 
				//	  cartlist.clear();
					  session.setAttribute("cartlist", cartlist);
					 
					
					
					
					
					
					
					
					
					
					
					JOptionPane.showMessageDialog(null, "Payment Success", "Info",
							JOptionPane.INFORMATION_MESSAGE);
					request.getRequestDispatcher("success.jsp").forward(request, response);
				}
				else
				{
					JOptionPane.showMessageDialog(null, "Payment Failed", "Info",
							JOptionPane.INFORMATION_MESSAGE);
				}
				
			
			}
			dbClose();
			
			
			
				
			}catch(Exception e)
			{
				System.out.println(e);
			}
			
		}
		if (page.equals("success")) {
			
			cartlist.clear();
			list4.clear();
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
			
			
		
		if (page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist, id);

			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}

		if (page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if (price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);

			session.setAttribute("list", list);

			if (action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if (action.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if (action.equals("mobiles"))
				request.getRequestDispatcher("fishes.jsp").forward(request, response);
			if (action.equals("laptops"))
				request.getRequestDispatcher("cats.jsp").forward(request, response);
			if (action.equals("clothing"))
				request.getRequestDispatcher("dogs.jsp").forward(request, response);
			if (action.equals("home-decor"))
				request.getRequestDispatcher("birds.jsp").forward(request, response);
		}

	}

}
