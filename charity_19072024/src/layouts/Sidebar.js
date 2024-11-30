import { Button, Nav, NavItem } from "reactstrap";
import Logo from "./Logo";
import { Link, useLocation } from "react-router-dom";
import { useState } from "react";
import GroupAddIcon from "@mui/icons-material/SupervisorAccount";

const navigation = [
  {
    title: "Case",
    href: "/starter/request",
    icon: require('../assets/images/case.png'),
    type:'img',
    width:30,
    height:30
    // submenu: [
    //   { title: "Request", href: "/starter/request",
    //   submenu: [ { title: "Live", href: "/starter/request/live"},{ title: "Rejected", href: "/starter/request/rejected"},{ title: "Draft", href: "/starter/request/draft"}] },
    //   { title: "Disbursement", href: "/starter/disbursement" },
    //   { title: "Repayment", href: "/starter/repayment" },
    // ],
  },
  {
    title: "My Fund",
    href: "/my-fund",
    icon: require('../assets/images/funds.png'),
     type:'img',
     width:30,height:30
  },
  // {
  //   title: "Settings",
  //   href: "/badges",
  //   icon: require('../assets/images/settings.png'),
  //    type:'img',
  //    width:20,height:20
  // },
  // {
  //   title: "Profile",
  //   href: "/buttons",
  //   icon: "bi bi-hdd-stack",
  //    type:'icon',
  // },
  {
    title: "Users",
    href: "/users",
    icon: "bi bi-card-text",
    icon: require('../assets/images/user.png'),
    type:'img',
    width:30,height:30
  },
];

const Sidebar = () => {
  const showMobilemenu = () => {
    document.getElementById("sidebarArea").classList.toggle("showSidebar");
  };
  let location = useLocation();

  const [toggle, setToggle] = useState(true);
  const [toggle2, setToggle2] = useState(false);
  return (
    <div className="p-3" style={{background:'#fff',height:'100vh'}}>
      <div className="d-flex align-items-center">
        <Logo />
        <span className="ms-auto d-lg-none">
          <Button
            close
            size="sm"
            className="ms-auto d-lg-none"
            onClick={() => showMobilemenu()}
          ></Button>
        </span>
      </div>
      <div className="pt-4 mt-2">
        <Nav vertical className="sidebarNav">
          {navigation.map((navi, index) => (
            <NavItem key={index} className="sidenav-bg">
              {!navi.submenu ? (
                <Link
                  to={navi.href}
                  className={
                    location.pathname === navi.href
                      ? "text-primary nav-link py-3"
                      : "nav-link text-secondary py-3"
                  }
                  onClick={()=>{
                     window.location.href = navi.href
                  }}
                >
               {navi?.type === 'img'? (<img style={{width:navi.width,height:navi.height}} src={navi.icon}/>):(   <GroupAddIcon />)}
                  <span
                    style={{ fontSize: 20 }}
                    className="ms-3 d-inline-block"
                  >
                    {navi.title}
                  </span>
                  {navi.submenu && (
                    <i
                      style={{ float: "right" }}
                      class="bi bi-chevron-right"
                    ></i>
                  )}
                </Link>
              ) : (
                <div onClick={()=> setToggle(!toggle)}>
                  <i className={navi.icon}></i>
                  <span
                    style={{ fontSize: 20 }}
                    className="ms-3 d-inline-block"
                  >
                    {navi.title}
                  </span>
                  {navi.submenu && (
                    <i
                      style={{ float: "right" }}
                      class="bi bi-chevron-right"
                    ></i>
                  )}
                </div>
              )}
              {toggle && (
                <>
                  {navi?.submenu?.map((sub, index) => (
                    <Link
                      to={sub.href}
                      className={
                        location.pathname === sub.href
                          ? "text-primary nav-link py-2"
                          : "nav-link text-secondary py-2"
                      }
                      style={{marginLeft: 20}}
                    >
                      <span
                        style={{ fontSize: 16 }}
                        className="ms-3 d-inline-block"
                      >
                        {sub.title}
                      </span>
                    </Link>
                  ))}
                </>
              )}
            </NavItem>
          ))}
          <Button
            color="danger"
            tag="a"
            target="_blank"
            className="mt-3"
            onClick={()=> window.location.href="/login" }
            // href="https://www.wrappixel.com/templates/xtreme-react-redux-admin/?ref=33"
          >
            {/* <Link
              to={"/login"}
              style={{ textDecoration: "none", color: "#fff" }}
            > */}
              Logout
            {/* </Link> */}
          </Button>
        </Nav>
      </div>
    </div>
  );
};

export default Sidebar;
