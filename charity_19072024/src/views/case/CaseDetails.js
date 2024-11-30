import React, { useState, useRef, useEffect } from "react";
import {
  Row,
  Col,
  Card,
  CardBody,
  CardTitle,
  Dropdown,
  DropdownToggle,
  DropdownMenu,
  DropdownItem,
  Form,
  FormGroup,
  Label,
  Input,
  Button,
  Modal,
  ModalBody,
  ModalFooter,
  ModalHeader,
} from "reactstrap";
import { countries } from "../../constants/countries";
import Header from "../../layouts/Header";
import { useLocation, useParams } from "react-router-dom";
import {
  API_APPROVE_UPDATE_CASE_,
  API_CASE_DETAILS,
  FILE_BASE_URL,
} from "../../services/ApiConstant";
import { get, put } from "../../services/Api";
import NewCaseForm from "../NewCaseForm";
import Approver from "../approver";
import RepaymentWidget from "../../components/RepaymentWidget";
import InstallmentsModal from "../../components/installmentsModal";
import QueryPopup from "../QueryPopup";
import ImageCarouselModal from "../../components/ImageCarouselModal";
import { useLoader } from "../../context/LoaderContext";
import Loader from "../../components/Loader";
import AlertPopupNew from "../../components/AlertPopupNew";
import TrackDisbursement from "../../components/trackDisbursement";
import TrackRepayment from "../../components/trackRepayment";

const CaseDetails = ({ route }) => {
  const [cardWidth, setCardWidth] = useState(0);
  const [margin, setMargin] = useState(0);
  const [count, setCount] = useState(0);

  const [proofOfIdentity, setProofOfIdentity] = useState(null);
  const [proofOfAddress, setProofOfAddress] = useState(null);
  const [proofOfIncome, setProofOfIncome] = useState(null);

  const [statesData, setStatesData] = useState([]);
  const [educationLevel, setEducationLevel] = useState("");
  const [state, setState] = useState("");
  const [district, setDistrict] = useState("");
  const [city, setCity] = useState("");
  const [pincode, setPincode] = useState("");

  const [dob, setDob] = useState("");
  const [gender, setGender] = useState("");
  const [profession, setProfession] = useState("");
  const [income, setIncome] = useState("");
  const [dependants, setDependants] = useState("");
  const [applicantType, setApplicantType] = useState("");
  const [applicantType2, setApplicantType2] = useState("");
  const [profilePic, setProfilePic] = useState(null);
  const [country, setCountry] = useState("");
  const [maritalStatus, setMaritalStatus] = useState("");
  const [occupation, setOccupation] = useState("");

  const [active, setACtive] = useState(0);

  const [permanentSameAsCurrent, setPermanentSameAsCurrent] = useState(false);
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const [nationality, setNationality] = useState("");
  const [religion, setReligion] = useState("");
  const [visible, setVisible] = useState(false);
  const [modalQuery, setModalQuery] = useState(false);

  const toggleQuery = () => setModalQuery(!modalQuery);

  const [isOpen2, setIsOpen2] = useState(false);

  const param = useParams();

  const location = useLocation();

  const [isApprove, setIsApprove] = useState(false);

  const [isTrackOpen, setIsTrackOpen] = useState(false);

  console.log("route=====", location?.state);

  const [isInstallMent, setInstallMent] = useState(false);

  const toggleModal = () => {
    setInstallMent(!isInstallMent);
  };
  const approvedAmount = 10000;
  const installmentCount = 12;

  const [isRepaymentWidgetOpen, setIsRepaymentWidgetOpen] = useState(false);

  const toggleRepaymentWidget = () => {
    setIsRepaymentWidgetOpen(!isRepaymentWidgetOpen);
  };

  // const data = location?.state;

  const [isOpen, setIsOpen] = React.useState(false);

  const [data, setData] = useState();

  const [caseData, setCaseData] = useState();

  const { loading } = useLoader();
  const { showLoader, hideLoader } = useLoader();

  const [dropdownOpen2, setDropdownOpen2] = useState(null);
  const [isRepayOpen, setIsRepayOpen] = useState(false);

  const toggleDropdown2 = (index) => {
    // if(index === dropdownOpen2){
    //   setDropdownOpen2(null);
    // }
  };

  const dropdownRef = useRef(null);

  useEffect(() => {
    if (dropdownOpen2 !== null) {
      document.addEventListener("mousedown", handleClickOutside);
    } else {
      document.removeEventListener("mousedown", handleClickOutside);
    }
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, [dropdownOpen2, data]);

  const handleClickOutside = (event) => {
    console.log("dropdownRef==", dropdownRef);
    event?.preventDefault();
    setTimeout(() => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setDropdownOpen2(null);
      } else if (!dropdownRef.current) {
        setDropdownOpen2(null);
      }
    }, 400);
  };

  const toggleTrackRepayWidget = () => {
    setIsRepayOpen(!isRepayOpen);
  };

  const toggleTrackWidget = () => setIsTrackOpen(!isTrackOpen);

  const onAction = async () => {
    const status = data?.case_info?.approval_status;
    const role = localStorage.getItem("user_role");

    if (status === "new" && role === "approver") {
      if (
        data?.case_info?.grant_type === "In Service" ||
        data?.case_info?.grant_type === "Non Repayable"
      ) {
        setIsApprove(true);
      } else {
        setIsApprove(false);
      }
      setIsOpen2(true);
    } else if (
      status === "new" &&
      role === "approver" &&
      data?.case_info?.pending_info
    ) {
      setIsOpen2(true);
    } else if (status === "disbursement") {
      toggleTrackWidget();

      // navigate("/case-details", { state: itm });
    } else if (status === "repayment") {
      toggleTrackRepayWidget();

      // navigate("/case-details", { state: itm });
    }
  };

  const onApprove = async (status, caseId) => {
    try {
      // const disbursement_details =
      showLoader();
      const payload = {
        status: status,
      };
      setVisible(false);
      const response = await put(
        API_APPROVE_UPDATE_CASE_ + caseId + "/",
        payload
      );
      hideLoader();
      getCaseDetails();
      // setActiveStep(2)
      // toggle();
      console.log("response==", response);
      // toggleModal();
    } catch (error) {
      console.log(error);
    }
  };

  const onMoreAction = (opt) => {
    if (opt === "Repay") {
      toggleTrackRepayWidget();
    } else if (opt === "Disburse") {
      toggleTrackWidget();
    } else if (opt === "Repayment Info") {
      toggleTrackRepayWidget();
    } else if (opt === "Disbursement Info") {
      toggleTrackWidget();
    } else if (opt === "Ask a Question") {
      toggleQuery();
    } else if (opt === "Reject") {
      setVisible(true);
    } else if (opt === "Close Case") {
      onApprove("closed", location?.state?.case_id);
    } else if (opt === "Approve") {
    }
  };

  const getStatus = (status) => {
    if (
      status === "new" ||
      status === "evaluation" ||
      status === "approval" ||
      status === "verification"
    ) {
      return "Approve";
      // return itm?.pending_info
      //   ? "? Answer Query"
      //   : isApprover
      //   ? "Approve"
      //   : "View & Edit";
    } else if (status === "disbursement") {
      return "Disburse";
    } else if (status === "repayment") {
      return "Repay";
    }

    // return status === "new" ? "View & Edit" : status === "Rejected" ? "Rejected" : "Pending"
  };

  useEffect(() => {
    if (location?.state && !modalQuery && !isOpen2) {
      // setData(location.state)
      getCaseDetails();
    }
  }, [modalQuery, isOpen,isOpen2]);

  const getCaseDetails = async () => {
    showLoader();
    const response = await get(
      API_CASE_DETAILS +
        "?case_id=" +
        location?.state?.case_id +
        "&coapplicant_user_id=" +
        location?.state?.coapplicant_user_id
    );
    hideLoader();
    setData(response);
    window.scrollTo(0, 0);
  };

  const [formData, setFormData] = useState({
    loanType: "",
    presentQualification: "",
    presentAcademicScore: "",
    courseAppliedFor: "",
    courseStartDate: "",
    courseEndDate: "",
    universityOrCollege: "",
    totalSemesters: "",
    admissionStatus: "",
    totalFees: "",
    supportingDocuments: "",
    comments: "",
    costOfProperty: "",
    existingPropertyValue: "",
    guidanceValueCost: "",
    propertyLocation: "",
    natureOfExpenditure: "",
    renovationComments: "",
  });

  const [activeStep, setActiveStep] = useState(null);

  const [options, setOptions] = useState({
    new: ["Ask a Question"],
    disbursement: ["Repay"],
    repayment: ["Disburse", "Close Case"],
    closed: ["Disbursement Info", "Repayment Info"],
    draft: ["Delete"],
  });

  useEffect(() => {
    const role = localStorage.getItem("user_role");

    if (role === "approver") {
      setOptions({
        new: ["Ask a Question", "Reject"],
        disbursement: ["Repay"],
        repayment: ["Disburse", "Close Case"],
        closed: ["Disbursement Info", "Repayment Info"],
        draft: ["Delete"],
      });
    } else {
      setOptions({
        new: ["Ask a Question", "Reject"],
        disbursement: ["Repay"],
        repayment: ["Disburse", "Close Case"],
        closed: ["Disbursement Info", "Repayment Info"],
        draft: ["Delete"],
      });
    }
  }, []);

  const handleNext = () => {
    setActiveStep((prevActiveStep) => prevActiveStep + 1);
  };

  const handleBack = () => {
    window.location.href = "/";
  };

  const handleReset = () => {
    setActiveStep(0);
  };
  const toggle = () => {
    setIsOpen(!isOpen);
    setActiveStep(null);
  };

  useEffect(() => {
    // Get screen width
    const screenWidth = window.innerWidth - 260;
    // Define minimum card width
    const minCardWidth = 375;
    // Calculate modulus value
    const modulus = Math.floor(screenWidth / minCardWidth);
    setCount(modulus);
    console.log("modulus==", modulus);
    if (modulus > 0) {
      const calculatedCardWidth = screenWidth / modulus;
      console.log("calculatedCardWidth==", calculatedCardWidth);
      console.log("screenWidth==", screenWidth);
      setMargin(0.03 * screenWidth);
      setCardWidth(calculatedCardWidth - 0.03 * screenWidth);
    } else {
      setCardWidth(350);
    }
    // Calculate card width
  }, []);

  const [showModal, setShowModal] = useState(false);

  const [img, setImg] = useState("");

  function capitalizeFirstLetter(string) {
    if (!string) return "";
    return string.charAt(0).toUpperCase() + string.slice(1);
  }
  const handleShow = (image) => {
    setImg(image);
    setShowModal(true);
  };
  const handleClose = () => setShowModal(false);

  return (
    <>
      {loading && <Loader />}
      <Row>
        <Col>
          <Header
            title={`View Case ${data?.case_info?.id} : [${
              data?.purpose_queries?.purpose_name
            }] ${data?.benefactor?.firstname} ${
              data?.benefactor?.lastname
            } - ${capitalizeFirstLetter(data?.case_info?.approval_status)}`}
            ishide={true}
            isBack={true}
          />

          <AlertPopupNew
            modal={visible}
            // title={""}
            title={
              "Cases once rejected cannot be reinstated in the approval process. Are you sure you want to reject the case?"
            }
            handleOk={() => onApprove("rejected", data?.case_info?.id)}
            handleCancel={() => setVisible(false)}
          />

          <QueryPopup
            caseId={location?.state?.case_id}
            isOpen={modalQuery}
            toggleQuery={toggleQuery}
          />
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              width: "100%",
              background: "#9FC5E8",
              height:40,
              alignItems:'center'
              // padding: 10,
              // paddingRight: 40,
            }}
          >
            <div style={{marginLeft:10}}>{data?.case_info?.short_description}</div>
            {/* <i  style={{marginRight:40,color:'#000'}} class="bi bi-pencil" onClick={()=>{

               setIsOpen(true);
               setActiveStep(0);
              
            }} ></i> */}
          </div>

          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 1 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className="p-3 mb-0"
              style={{
                background: activeStep === 1 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>Benefactor Information</strong>
              <i
                className="bi bi-pencil"
                onClick={() => {
                  setIsOpen(true);
                  setActiveStep(1);
                  setCaseData(data?.benefactor);
                }}
                style={{ color: "#000", cursor: "pointer" }}
              ></i>
            </CardTitle>
            <div style={{ display: "flex", flexWrap: "wrap" }}>
              <div style={{ flex: "1", padding: "10px" }}>
                <img
                  src={FILE_BASE_URL + data?.benefactor?.profile_pic}
                  alt="Profile"
                  style={{
                    width: "150px",
                    height: "150px",
                    borderRadius: "50%",
                  }}
                />
              </div>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>First Name</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.firstname || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Email</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.email || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Phone No.</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.phoneno || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Address</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.address?.current_address?.address_line1|| '--'}{" "}
                    {data?.benefactor?.address?.current_address?.cur_town}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Gender</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.gender === "M" ? "Male" : "Female"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Address Proof
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.address_copy?.endsWith(".pdf") ? (
                      <a
                        href={`${FILE_BASE_URL}${data?.benefactor?.address_copy}`}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{
                          fontSize: 14,
                          cursor: "pointer",
                          color: "blue",
                        }}
                      >
                        <i class="bi bi-paperclip"></i>

                        {data?.benefactor?.address_proof}
                      </a>
                    ) : (
                      <>
                        {data?.benefactor?.address_copy ? (
                          <a
                            style={{
                              color: "blue",
                              cursor: "pointer",
                              textDecoration: "underline",
                            }}
                            onClick={() =>
                              handleShow(data?.benefactor?.address_copy)
                            }
                          >
                            {" "}
                            <i class="bi bi-paperclip"></i>

                            {data?.benefactor?.address_proof}
                          </a>
                        ) : (
                          <a rel="noopener noreferrer" style={{ fontSize: 14 }}>
                            {data?.benefactor?.address_proof || "--"}
                          </a>
                        )}
                      </>
                    )}
                  </div>
                </div>
              </div>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Last Name</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.lastname || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Date of birth
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.dob || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Profession</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.profession || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Monthly Income
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.monthly_income || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Income Proof
                  </div>

                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.income_copy?.endsWith(".pdf") ? (
                      <a
                        href={`${FILE_BASE_URL}${data?.benefactor?.income_copy}`}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{
                          fontSize: 14,
                          cursor: "pointer",
                          color: "blue",
                        }}
                      >
                        <i class="bi bi-paperclip"></i>

                        {data?.benefactor?.income_proof}
                      </a>
                    ) : (
                      <>
                        {data?.benefactor?.income_copy ? (
                          <a
                            style={{
                              color: "blue",
                              cursor: "pointer",
                              textDecoration: "underline",
                            }}
                            onClick={() =>
                              handleShow(data?.benefactor?.income_copy)
                            }
                          >
                            {" "}
                            <i class="bi bi-paperclip"></i>

                            {data?.benefactor?.income_proof}
                          </a>
                        ) : (
                          <a
                            rel="noopener noreferrer"
                            style={{
                              fontSize: 14,
                            }}
                          >
                            {data?.benefactor?.income_proof || "--"}
                          </a>
                        )}
                      </>
                    )}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Identity Proof
                  </div>

                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.benefactor?.identity_proof_copy?.endsWith(".pdf") ? (
                      <a
                        href={`${FILE_BASE_URL}${data?.benefactor?.identity_proof_copy}`}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{
                          fontSize: 14,
                          cursor: "pointer",
                          color: "blue",
                        }}
                      >
                        <i class="bi bi-paperclip"></i>

                        {data?.benefactor?.identity_proof}
                      </a>
                    ) : (
                      <>
                        {data?.benefactor?.identity_proof_copy ? (
                          <a
                            style={{
                              color: "blue",
                              cursor: "pointer",
                              textDecoration: "underline",
                            }}
                            onClick={() =>
                              handleShow(data?.benefactor?.identity_proof_copy)
                            }
                          >
                            {" "}
                            <i class="bi bi-paperclip"></i>

                            {data?.benefactor?.identity_proof}
                          </a>
                        ) : (
                          <a
                            rel="noopener noreferrer"
                            style={{
                              fontSize: 14,
                            }}
                          >
                            {data?.benefactor?.identity_proof || "--"}
                          </a>
                        )}
                      </>
                    )}
                  </div>
                </div>
              </div>
            </div>

            <ImageCarouselModal
              show={showModal}
              handleClose={handleClose}
              image={img}
            />
          </Card>
          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 3 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className=" p-3 mb-0"
              style={{
                background: activeStep === 3 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>Co-Applicant Information</strong>
              <i
                class="bi bi-pencil"
                onClick={() => {
                  setIsOpen(true);
                  setActiveStep(3);
                  console.log("======", data?.co_applicant_details);
                  if (data?.co_applicant_details) {
                    setCaseData(data?.co_applicant_details);
                  } else {
                    setCaseData({ address: { current_address: {} } });
                  }
                }}
                style={{ color: "#000", cursor: "pointer" }}
              ></i>
            </CardTitle>
            <div style={{ display: "flex", flexWrap: "wrap" }}>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>First Name</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.firstname || "--"}
                  </div>
                </div>{" "}
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Email</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.email || "--"}
                  </div>
                </div>{" "}
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Phone No.</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.phoneno || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Address Proof
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.address_copy?.endsWith(
                      ".pdf"
                    ) ? (
                      <a
                        href={`${FILE_BASE_URL}${data?.co_applicant_details?.address_copy}`}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{ fontSize: 14, color: "blue" }}
                      >
                        {data?.co_applicant_details?.address_proof}
                      </a>
                    ) : (
                      <>
                        {data?.co_applicant_details?.address_copy ? (
                          <a
                            style={{
                              color: "blue",
                              textDecoration: "underline",
                            }}
                            onClick={() =>
                              handleShow(
                                data?.co_applicant_details?.address_copy
                              )
                            }
                          >
                            {" "}
                            <i class="bi bi-paperclip"></i>

                            {data?.co_applicant_details?.address_proof}
                          </a>
                        ) : (
                          <a
                            rel="noopener noreferrer"
                            style={{ fontSize: 14, color: "blue" }}
                          >
                            {data?.co_applicant_details?.address_proof || "--"}
                          </a>
                        )}
                      </>
                    )}
                  </div>
                </div>
              </div>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Last Name</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.lastname || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Date of birth
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.dob || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Profession</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.profession || "--"}
                  </div>
                </div>

                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Identity Proof
                  </div>

                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.identity_proof_copy?.endsWith(
                      ".pdf"
                    ) ? (
                      <a
                        href={`${FILE_BASE_URL}${data?.co_applicant_details?.identity_proof_copy}`}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{
                          fontSize: 14,
                          color: "blue",
                          cursor: "pointer",
                        }}
                      >
                        <i class="bi bi-paperclip"></i>

                        {data?.co_applicant_details?.identity_proof}
                      </a>
                    ) : (
                      <>
                        {data?.co_applicant_details?.identity_proof_copy ? (
                          <a
                            style={{
                              color: "blue",
                              textDecoration: "underline",
                              cursor: "pointer",
                            }}
                            onClick={() =>
                              handleShow(
                                data?.co_applicant_details?.identity_proof_copy
                              )
                            }
                          >
                            {" "}
                            <i class="bi bi-paperclip"></i>

                            {data?.co_applicant_details?.identity_proof}
                          </a>
                        ) : (
                          <a style={{ fontSize: 14 }}>
                            {" "}
                            {data?.co_applicant_details?.identity_proof || "--"}
                          </a>
                        )}
                      </>
                    )}
                  </div>
                </div>
              </div>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Address</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {
                      data?.co_applicant_details?.address?.current_address
                        ?.address_line1|| '--'
                    }
                    &nbsp;{" "}
                    {
                      data?.co_applicant_details?.address?.current_address
                        ?.cur_town
                    }
                  </div>
                </div>{" "}
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Gender</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.gender === "M"
                      ? "Male"
                      : "Female"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Monthly Income
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.monthly_income || "--"}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Income Proof
                  </div>

                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.co_applicant_details?.income_copy?.endsWith(
                      ".pdf"
                    ) ? (
                      <a
                        href={`${FILE_BASE_URL}${data?.co_applicant_details?.income_copy}`}
                        target="_blank"
                        rel="noopener noreferrer"
                        style={{ fontSize: 14, color: "blue" }}
                      >
                        <i class="bi bi-paperclip"></i>

                        {data?.co_applicant_details?.income_proof}
                      </a>
                    ) : (
                      <>
                        {data?.co_applicant_details?.income_copy ? (
                          <a
                            style={{
                              color: "blue",
                              textDecoration: "underline",
                            }}
                            onClick={() =>
                              handleShow(
                                data?.co_applicant_details?.income_copy
                              )
                            }
                          >
                            {" "}
                            <i class="bi bi-paperclip"></i>

                            {data?.co_applicant_details?.income_proof || "--"}
                          </a>
                        ) : (
                          <a style={{ fontSize: 14 }}>
                            {" "}
                            {data?.co_applicant_details?.income_proof|| '--'}
                          </a>
                        )}
                      </>
                    )}
                  </div>
                </div>
              </div>
            </div>
          </Card>
          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 2 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className=" p-3 mb-0"
              style={{
                background: activeStep === 2 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>Primary Case Information</strong>
              <i
                class="bi bi-pencil"
                onClick={() => {
                  setIsOpen(true);
                  setActiveStep(2);
                  setCaseData(data?.case_info);
                }}
                style={{ color: "#000" }}
              ></i>
            </CardTitle>
            <div style={{ display: "flex", flexWrap: "wrap" }}>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Approval Status
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {capitalizeFirstLetter(data?.case_info?.approval_status)|| '--'}
                  </div>
                </div>{" "}
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Collateral</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.collateral|| '--'}
                  </div>
                </div>{" "}
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Disbursement Schedule
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.approval_status !== "new" ? (
                      <a
                        // onClick={toggleModal}
                        style={{ textDecoration: "none" }}
                        className="MuiTypography-root MuiTypography-subtitle css-1jh0mz3"
                      >
                        {capitalizeFirstLetter(
                          data?.case_info?.disbursement_schedule
                        ) || "--"}
                      </a>
                    ) : (
                      <a
                        onClick={toggleModal}
                        style={{ color: "blue", cursor: "pointer" }}
                        className="MuiTypography-root MuiTypography-subtitle css-1jh0mz3"
                      >
                        {capitalizeFirstLetter(
                          data?.case_info?.disbursement_schedule
                        ) || "--"}
                      </a>
                    )}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Repayable</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {"₹" +
                      (parseFloat(data?.case_info?.pending_repayment) +
                        parseFloat(data?.case_info?.repayment_received)) ||
                      "--"}
                  </div>
                </div>{" "}
              </div>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Repayment</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.approval_status !== "new" ? (
                      <a style={{ textDecoration: "none" }}>
                        {capitalizeFirstLetter(data?.case_info?.grant_type)}
                      </a>
                    ) : (
                      <a
                        onClick={toggleRepaymentWidget}
                        style={{
                          color: "blue",
                          cursor: "pointer",
                          textDecoration: "underline",
                        }}
                      >
                        {capitalizeFirstLetter(data?.case_info?.grant_type)}
                      </a>
                    )}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Guarantor Email
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.guarantor_email|| '--'}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Guarantor Name
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.guarantor_name|| '--'}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Repaid</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {/* ₹{data?.case_info?.repayment_received|| '--'} */}
                    {"₹" +
                     
                        parseFloat(data?.case_info?.repayment_received) ||
                      "--"}
                  </div>
                </div>{" "}
              </div>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Guarantor Phone
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.guarantor_phone|| '--'}
                  </div>
                </div>{" "}
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Purpose</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.purpose|| '--'}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Referred_by</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {data?.case_info?.referred_by|| '--'}
                  </div>
                </div>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>
                    Next Repayable
                  </div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    {/* {data?.case_info?.collateral} */}
                    {data?.case_info?.next_repay_days > 0 ? (
                      <p>
                        ₹{data?.case_info?.next_repay_amt} in{" "}
                        {data?.case_info?.next_repay_days}d
                      </p>
                    ) : (
                      <>
                        {!data?.case_info?.next_repay_days ? (
                          <p>--</p>
                        ) : (
                          <>
                            <p style={{ color: "red", fontWeight: 400 }}>
                              ₹{data?.case_info?.next_repay_amt} due
                            </p>
                          </>
                        )}
                      </>
                    )}
                  </div>
                </div>{" "}
              </div>
            </div>
          </Card>
          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 0 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className=" p-3 mb-0"
              style={{
                background: activeStep === 0 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>Case Purpose Details</strong>
              <i
                class="bi bi-pencil"
                onClick={() => {
                  setIsOpen(true);
                  setActiveStep(0);
                  setCaseData(data?.purpose_queries);
                }}
                style={{ color: "#000" }}
              ></i>
            </CardTitle>

            <div style={{ width: "100%", display: "flex", flexWrap: "wrap" }}>
              {data?.purpose_queries?.question_details?.map((itm) => (
                <div
                  style={{ width: cardWidth, marginTop: 8, padding: "10px" }}
                >
                  <div style={{ fontSize: 14, color: "grey" }}>
                    {itm?.question_text}
                  </div>
                  {itm?.answer_text?.includes("media/purpose") ? (
                    itm?.answer_text?.endsWith(".pdf") ? (
                      <div>
                        <a
                          href={`${FILE_BASE_URL}${itm?.answer_text}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          style={{ fontSize: 14, color: "blue" }}
                        >
                          <i class="bi bi-paperclip"></i>View PDF 
                        </a>
                      </div>
                    ) : (
                      <img
                        src={`${FILE_BASE_URL}${itm?.answer_text}`}
                        style={{ width: 100, height: 100 }}
                        alt="Preview"
                      />
                    )
                  ) : (
                    <div style={{ fontSize: 14, color: "#000" }}>
                      {itm?.answer_text}
                    </div>
                  )}
                </div>
              ))}
            </div>
          </Card>
          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 4 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className=" p-3 mb-0"
              style={{
                background: activeStep === 4 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>My Queries</strong>
              <i
                class="bi bi-pencil"
                onClick={() => {
                  toggleQuery();
                  setActiveStep(4);
                }}
                style={{ color: "#000" }}
              ></i>
            </CardTitle>

            {data?.case_query?.map((itm) => (
              <div style={{ width: cardWidth, margin: 8 }}>
                <div style={{ fontSize: 14, color: "#000" }}>
                  {itm?.question_text}?
                </div>
                <div style={{ fontSize: 14, color: "#000" }}>
                  {itm?.answer_text}
                </div>
              </div>
            ))}
          </Card>
          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 5 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className=" p-3 mb-0"
              style={{
                background: activeStep === 5 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>Other Queries</strong>
              <i
                class="bi bi-pencil"
                onClick={() => {
                  setIsOpen(true);
                  setActiveStep(4);
                }}
                style={{ color: "#000" }}
              ></i>
            </CardTitle>
          </Card>
          <Card
            style={{
              margin: 20,
              height: "auto",
              overflow: "hidden",
              background: activeStep === 6 ? "#FCE599" : "#fff",
            }}
          >
            <CardTitle
              tag="h6"
              className=" p-3 mb-0"
              style={{
                background: activeStep === 6 ? "#FCE599" : "#fff",
                display: "flex",
                justifyContent: "space-between",
              }}
            >
              <strong>Case History</strong>
              <i
                class="bi bi-pencil"
                onClick={() => {
                  setIsOpen(true);
                  setActiveStep(5);
                }}
                style={{ color: "#000" }}
              ></i>
            </CardTitle>
            <div style={{ display: "flex", flexWrap: "wrap" }}>
              <div style={{ flex: "1", padding: "10px" }}>
                <div style={{ width: cardWidth, marginTop: 8 }}>
                  <div style={{ fontSize: 14, color: "grey" }}>Evaluator</div>
                  <div style={{ fontSize: 14, color: "#000" }}>
                    Ramachandran Krishnan, Ramachandran Krishnan, Ramachandran
                    Krishnan <a style={{ color: "blue" }}>Edit Evaluator</a>
                  </div>
                </div>{" "}
              </div>
            </div>
          </Card>

          {/* <div
            style={{
              display: "flex",
              width: "95%",
              gap: 20,
              margin: "0px auto",
              justifyContent: "center",
            }}
          >
        
            <Button
              style={{ width: "20%" }}
              onClick={handleBack}
              disabled={activeStep === 0}
            >
              <i class="bi bi-x-lg"></i> Cancel
            </Button>
            <Button
              style={{ width: "20%" }}
              onClick={handleBack}
              disabled={activeStep === 0}
            >
              <i class="bi bi-question"></i> Ask a question
            </Button>

            <Button
              style={{ width: "20%" }}
              color="primary"
              onClick={() => setIsOpen2(true)}
            >
              Approve <i class="bi bi-check2"></i>
            </Button>
          </div> */}

          {getStatus(data?.case_info?.approval_status) && (
            <div
              style={{
                display: "flex",
                paddingTop: 10,
                paddingBottom: 5,
                alignItems: "center",
                paddingRight: 10,
                justifyContent: "flex-end",
              }}
            >
              <Button
                style={{ width: 180 }}
                onClick={handleBack}
                disabled={activeStep === 0}
              >
                <i class="bi bi-x-lg"></i> Cancel
              </Button>
              {data?.case_info?.approval_status === "draft" ? (
                <Button
                  size="sm"
                  disabled
                  style={{
                    width: 140,
                    marginRight: 15,
                    background: "#6c757d",
                  }}
                >
                  Delete
                </Button>
              ) : (
                <div ref={dropdownRef}>
                  <Dropdown
                    isOpen={dropdownOpen2 === location?.state?.case_id}
                    toggle={() => toggleDropdown2(location?.state?.case_id)}
                  >
                    <DropdownToggle
                      style={{
                        background: "none",
                        border: "none",
                        cursor: "pointer",
                      }}
                    >
                      <Button
                        onClick={() =>
                          setDropdownOpen2(location?.state?.case_id)
                        }
                        color="info"
                        outline
                        style={{ width: 180 }}
                      >
                        More Actions...{" "}
                        <i
                          class="bi bi-caret-down-fill"
                          style={{ color: "#000" }}
                        ></i>
                      </Button>
                    </DropdownToggle>
                    <DropdownMenu right>
                      {options?.[data?.case_info?.approval_status]?.map(
                        (otp) => (
                          <DropdownItem onClick={() => onMoreAction(otp)}>
                            {/* <Link to="/new-case" style={{ textDecoration: "none" }}> */}
                            {otp}
                            {/* </Link> */}
                          </DropdownItem>
                        )
                      )}
                    </DropdownMenu>
                  </Dropdown>
                </div>
              )}
              <Button
                onClick={() => onAction()}
                style={{ width: 180 }}
                color="primary"
              >
                {getStatus(data?.case_info?.approval_status)}
              </Button>
            </div>
          )}
        </Col>
      </Row>

      {isOpen && (
        <NewCaseForm
          {...{ isOpen, setIsOpen }}
          type="edit"
          editData={data}
          step={activeStep}
          caseData={caseData}
        />
      )}
      {isOpen2 && (
        <Approver
          {...{ isOpen2, setIsOpen2 }}
          caseId={location?.state?.case_id}
          isApprove={isApprove}
        />
      )}

      <div>
        {/* <Button color="primary" onClick={toggleRepaymentWidget}>
            Open Repayment Widget
          </Button> */}
        <RepaymentWidget
          isOpen={isRepaymentWidgetOpen}
          toggleModal={toggleRepaymentWidget}
          casId={location?.state?.case_id}
        />
      </div>

      <div>
        {/* <Button color="primary" onClick={toggleModal}>
            Open Popup
          </Button> */}
        <InstallmentsModal
          isOpen={isInstallMent}
          toggleModal={toggleModal}
          casId={location?.state?.case_id}
        />
      </div>

      <TrackDisbursement
        caseId={location?.state?.case_id}
        isOpen={isTrackOpen}
        toggleTrackWidget={toggleTrackWidget}
      />
      <TrackRepayment
        caseId={location?.state?.case_id}
        isOpen={isRepayOpen}
        toggleTrackWidget={toggleTrackRepayWidget}
      />
    </>
  );
};

export default CaseDetails;
