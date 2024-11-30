import React, { useState, useEffect } from "react";
import {
  Button,
  ButtonGroup,
  Col,
  Row,
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
  FormGroup,
  Label,
  Input,
} from "reactstrap";
import ProjectTables from "../../components/dashboard/ProjectTable";

import { useNavigate } from "react-router-dom";
import Header from "../../layouts/Header";
import jsonData from "../../assets/csvjson.json";
import ReactSelect from "react-select";
import { components } from "react-select";
import UserTable from "../../components/dashboard/UserTable";
import AddUserModal from "./AddUserModal";
import { get } from "../../services/Api";
import { API_USER_LIST } from "../../services/ApiConstant";
import { useLoader } from "../../context/LoaderContext";
import Loader from "../../components/Loader";
// import { get } from "../";


const Users = () => {
  const navigate = useNavigate();
  const [rSelected, setRSelected] = useState(1);

  const [modalOpen, setModalOpen] = useState(false);
  const [campaignData, setCampaignData] = useState([]);


  

  const [tags, setTags] = useState([]);
  const [selectedTags, setSelectedTags] = useState([]);

  const { loading } = useLoader();
  const handleChangeTag = (selectedOptions) => {
    setSelectedTags(selectedOptions);
  };

  const toggleModal = () => {
    setModalOpen(!modalOpen);
  };

  const [data, setData] = useState(null);

  const { showLoader, hideLoader } = useLoader();
  useEffect(() => {
    showLoader();
    getUsers();
    // let filData = [];

    // if (rSelected === 1) {
    //   filData = jsonData?.filter((item) => item["Campaign State"] === "Live");
    // } else if (rSelected === 2) {
    //   filData = jsonData?.filter(
    //     (item) => item["Campaign State"] === "Expired"
    //   );
    // } else if (rSelected === 3) {
    //   filData = jsonData?.filter((item) => item["Campaign State"] === "Draft");
    // } else {
    //   filData = jsonData;
    // }
    // // else if(rSelected===4){
    // //   filData = jsonData?.filter((item) => item['Campaign State'] === 'Live');

    // // }

    // const allCampaign = localStorage.getItem("campaigns");
    // if (allCampaign) {
    //   filData = [...filData, ...JSON.parse(allCampaign)];
    // }
    // const uniqueTagValues = [...new Set(jsonData.map((item) => item.Campaign_tag))];
    // const tag = uniqueTagValues?.map((item) => {
    //   let tag = {label:item,value:item}
     
    //   return tag
    // });

    // setTags(tag)

    // console.log("tag====",tag)

    // setData([...filData]);
    // console.log(rSelected);
  }, [rSelected]);


  const getUsers =  async () => {
    const response = await get(API_USER_LIST);
    setCampaignData(response);
    hideLoader()

    console.log("response====", response);
  };


  const handleInputChange = (e) => {
    const { name, value, type, checked } = e.target;
    const newValue = type === "checkbox" ? checked : value;
    setCampaignData({ ...campaignData, [name]: newValue });
  };

  const handleSubmit = () => {
    let allCampaign = localStorage.getItem("campaigns");

    if (allCampaign) {
      allCampaign = JSON.parse(allCampaign);
    } else {
      allCampaign = [];
    }

    allCampaign.push({
      ...campaignData,
      ["Campaign State"]: "Draft",
      id: Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000,
    });
    console.log(allCampaign);
    localStorage.setItem("campaigns", JSON.stringify(allCampaign));

    toggleModal();
    navigate("/add-campaign", { state: campaignData });
  };

  const onRadioBtnClick = (rSelected) => {
    setRSelected(rSelected);
  };

  const handleClick = () => {
    navigate("/add-campaign");
  };

  return (
    <>
    {loading && <Loader />}
      <Header title={"Users"} />
      <div style={{ width: "95%", margin: "0px auto" }}>
        <Row>
          <Col lg="12">
            <div
              style={{
                display: "flex",
                padding: 10,
                width: "100%",
                justifyContent: "flex-end",
                alignItems: "center",
              }}
            >
          
              <div>
                {/* <Button
                  color="light-success"
                  style={{ width: 200, height: 50, fontSize: 18 }}
                  onClick={toggleModal}
                >
                  + New User
                </Button> */}
              
              </div>
            </div>
            <UserTable data={campaignData} />

            <AddUserModal {...{modalOpen, setModalOpen}}/>
          </Col>
        </Row>
        {/***Blog Cards***/}
      </div>
    </>
  );
};

export default Users;
