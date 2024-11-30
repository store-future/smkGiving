import React, { useEffect, useState } from "react";
import {
  Button,
  Modal,
  ModalHeader,
  ModalBody,
  FormGroup,
  Label,
  Input,
  Table,
  ModalFooter,
  Tooltip,
} from "reactstrap";
import "../styles.css";
import { AiOutlineClose } from "react-icons/ai";
import {
  API_APPROVE_UPDATE_CASE_,
  API_GET_DISBURSEMENT,
  API_GET_REPAYMENT,
  API_UPDATE_DISBURSEMENT,
  API_UPDATE_REPAYMENT,
  API_UPDATE_TRACK_DISBURSEMENT,
  API_UPDATE_TRACK_REPAYMENT,
} from "../../services/ApiConstant";
import { get, post, put } from "../../services/Api";
import moment from "moment/moment";
import AlertPopupNew from "../AlertPopupNew";

const TrackRepayment = ({ isOpen, toggleTrackWidget, caseId }) => {
  // Calculate auto-populated values
  // const installmentAmt = approvedAmount / installmentCount;
  const [installmentCount, setInstallmentCount] = useState();
  const [requestAmt, setRequestAmt] = useState();
  const [approvAmt, setApproveAmt] = useState();
  const [date, setDate] = useState(new Date());
  const [plan, setPlan] = useState("");
  const [isTrack, setIsTrack] = useState(false);
  const [tooltipOpen, setTooltipOpen] = useState({});
  const [disbursed_amt, setDisbursement] = useState();
  const [disbursement_txn_info, setdisbursement_txn_info] = useState();
  const [disbursed_date, setDisbursedDate] = useState();
  const [disburseId, setDisburseId] = useState();
  const [isAddRow, setIsAddRow] = useState(false);
  const [trackAmt, setTrackAmt] = useState();

  const [modal, setModal] = useState(false);

  const toggle = () => setModal(!modal);

  const [data, setData] = useState();

  const toggleTooltip = (id) => {
    setTooltipOpen((prevState) => ({
      ...prevState,
      [id]: !prevState[id],
    }));
  };

  const [schedule, setSchedule] = useState([]);

  // useEffect(() => {
  //   if (caseId && !isTrack) {
  //     console.log("caseId===11", caseId, isTrack);
  //     getDisbursment();
  //   }
  // }, [caseId, isTrack, isOpen]);


  useEffect(() => {
    if(isOpen){
    if (caseId && !isTrack) {
      getDisbursment();
    }


  }

  if(isTrack || isAddRow){
    console.log("called-----")
    setDisbursement(0)
    setdisbursement_txn_info('')
    setDisbursedDate('')
    setDate('');
  }
  }, [caseId, isTrack,isOpen,isAddRow]);


  const getDisbursment = async () => {
    try {
      const disbursementData = await get(
        API_GET_REPAYMENT + "?case_id=" + caseId
      );
      setData(disbursementData);
      setSchedule(disbursementData?.repayment_details || []);
      console.log("response===", disbursementData);
    } catch (error) {
      console.error("Error fetching purpose details:", error);
    }
  };

  const onApprove = async (status, caseId) => {
    try {
      // const disbursement_details =

      const payload = {
        status: status,
      };

      const response = await put(
        API_APPROVE_UPDATE_CASE_ + caseId + "/",
        payload
      );
      // getCaseList();
      // setActiveStep(2)
      // toggle();
      setModal(false)
      setIsTrack(false);
      setIsAddRow(false);
      toggleTrackWidget();
      // console.log("response==", response);
      // toggleModal();
    } catch (error) {
      console.log(error);
    }
  };

  const handleSave = async () => {
    try {
      if (isAddRow) {
        const updatedSchedule = [...schedule];
        updatedSchedule[schedule?.length] = {
          planned_repayment_amt: disbursed_amt,
          planned_date: date,
          repayment_date: null,
          repayment_status: "pending",

          created_by: 0,
          updated_by: 0,
          repayment_date: null,
          actual_repayment_amt: "0.00",
          outstanding_amt: "0.00",
          tot_repayed_amt: "0.00",
          repayment_txn_info: null,
        };

        const payload = {
          ...data,
          repayment_count: updatedSchedule?.length,
          repayment_details: updatedSchedule,
        };

        const response = await put(
          API_UPDATE_REPAYMENT + caseId + "/",
          payload
        );

        setIsAddRow(false);

        setIsTrack(false);

        console.log(response);
      } else {
        console.log("schedule==", schedule);
        const payload = {
          id: disburseId,
          actual_repayment_amt: parseFloat(disbursed_amt),
          repayment_txn_info: disbursement_txn_info,
          repayment_date: disbursed_date,
        };

        const response = await put(
          API_UPDATE_TRACK_REPAYMENT + caseId + "/",
          payload
        );
        setIsTrack(false);
        setIsAddRow(false);
        console.log("response==", response);
      }
      // const disbursement_details =

      // toggleModal();
    } catch (error) {
      console.log(error);
    }
  };

  const handleAddRow = () => {
    // const newRow = {
    //   sequence: schedule.length + 1,
    //   planned: "",
    //   actual: "",
    // };
    // setSchedule([...schedule, newRow]);

    setIsAddRow(true);
    setIsTrack(true);
  };

  return (
    <Modal
      isOpen={isOpen}
      toggle={() => (isTrack ? setIsTrack(false) : toggleTrackWidget())}
      style={{ width: "100%" }}
    >
      <ModalHeader
        toggle={() => {
          setIsTrack(false);
          // toggleTrackWidget();
          setIsAddRow(false);

          if (!isTrack && !isAddRow) {
            toggleTrackWidget();
          }
        }}
      >
        Track Repayment : Case {caseId}
      </ModalHeader>
      {!isTrack ? (
        <ModalBody
          style={{
            maxHeight: "calc(100vh - 300px)",
            overflowY: "scroll",
            overflowX: "hidden",
          }}
        >
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
            }}
          >
            <div style={{ width: "60%" }}>
              {/* <h5 style={{ fontSize: 14}}>
                <span>Repayble :</span>{" "}
              </h5>

              <h5 style={{ fontSize: 14}}>
                <strong>{data?.request_amt}</strong>
              </h5> */}
              <p
                style={{ fontSize: 14, color: "grey" }}
                className="MuiTypography-root MuiTypography-caption-sm css-1apuigl"
              >
                Repayable
              </p>
              <p className="MuiTypography-root MuiTypography-subtitle css-1jh0mz3">
                ₹{data?.repay_percent}
              </p>
            </div>
            <div style={{ width: "40%", textAlign: "left" }}>
              {/* <h5 style={{ fontSize: 14}}>Repaid</h5>
              <h5 style={{ fontSize: 14}}>
                {" "}
                <strong>{data?.repayment_received}</strong>
              </h5> */}

              <p
                style={{ fontSize: 14, color: "grey" }}
                className="MuiTypography-root MuiTypography-caption-sm css-1apuigl"
              >
                Repaid
              </p>
              <p className="MuiTypography-root MuiTypography-subtitle css-1jh0mz3">
                ₹{data?.repayment_received}
              </p>
            </div>
          </div>

          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              alignItems: "center",
              marginTop: 10,
            }}
          >
            <div style={{ width: "60%" }}>
              {/* <h5 style={{ fontSize: 14}}>Repayment Type</h5>
              <h5 style={{ fontSize: 14}}>
                {" "}
                <strong>{data?.grant_type} </strong>
              </h5> */}

              <p
                style={{ fontSize: 14, color: "grey" }}
                className="MuiTypography-root MuiTypography-caption-sm css-1apuigl"
              >
                Repayment Type
              </p>
              <p className="MuiTypography-root MuiTypography-subtitle css-1jh0mz3">
                {data?.repay_plan}
              </p>
            </div>
            <div style={{ width: "40%", textAlign: "left" }}>
              {/* <h5 style={{ fontSize: 14}}>Outstanding</h5>

              <h5 style={{ fontSize: 14}}>
                {" "}
                <strong>{data?.pending_repayment}</strong>
              </h5> */}
              <p
                style={{ fontSize: 14, color: "grey" }}
                className="MuiTypography-root MuiTypography-caption-sm css-1apuigl"
              >
                Outstanding
              </p>
              <p className="MuiTypography-root MuiTypography-subtitle css-1jh0mz3">
                ₹{data?.pending_repayment}
              </p>
            </div>
          </div>
          {schedule.length > 0 && (
            <Table style={{ marginTop: 15, background: "#fff" }}>
              <thead>
                <tr>
                  <th></th>
                  <th>Planned</th>
                  <th>Actual</th>
                </tr>
              </thead>
              <tbody>
                {schedule.map((item, index) => (
                  <tr
                    key={index}
                    style={{ borderRight: "2px solid #d5f3f2", padding: 10 }}
                  >
                    <td
                      style={{
                        borderRight: "2px solid #d5f3f2",
                        borderBottom: "2px solid #d5f3f2",
                      }}
                    >
                      {index + 1}
                    </td>
                    <td
                      style={{
                        borderRight: "2px solid #d5f3f2",
                        borderBottom: "2px solid #d5f3f2",
                      }}
                    >
                      ₹{item?.planned_repayment_amt} on{" "}
                      {moment(item?.planned_date, "YYYY-MM-DD").format(
                        "MMMM D, YYYY"
                      )}
                    </td>
                    <td
                      style={{
                        borderRight: "2px solid #d5f3f2",
                        borderBottom: "2px solid #d5f3f2",
                      }}
                    >
                      {item?.repayment_date ? (
                        <>
                          ₹{item?.actual_repayment_amt} on{" "}
                          {moment(item?.repayment_date, "YYYY-MM-DD").format(
                            "MMMM D, YYYY"
                          )}
                          <i
                            class="bi bi-info-circle"
                            style={{ cursor: "pointer", marginLeft: 5 }}
                            id={"closeIcon" + index}
                          ></i>
                          <Tooltip
                            placement="top"
                            isOpen={tooltipOpen?.[index]}
                            target={"closeIcon" + index}
                            toggle={() => toggleTooltip(index)}
                          >
                            {item?.repayment_txn_info}
                          </Tooltip>
                        </>
                      ) : (
                        <Button
                          onClick={() => {
                            setDisburseId(item?.id);
                            setIsTrack(true);
                            setIsAddRow(false);
                            setTrackAmt(item?.planned_repayment_amt);
                          }}
                          color="primary"
                          outline
                        >
                          Track
                        </Button>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </Table>
          )}

          {/* {schedule?.length > 0 && ( */}
          {schedule?.length === 0 && <br />}
          <div
            onClick={handleAddRow}
            style={{ color: "blue", cursor: "pointer" }}
          >
            + Add Row
          </div>
          {/* )} */}
        </ModalBody>
      ) : (
        <>
          {isAddRow ? (
            <ModalBody>
              <FormGroup
                className="form-group-input"
                style={{ paddingLeft: 0 }}
              >
                <h5 style={{ fontSize: 14, width: 300 }}>
                  Planned Repayment Date
                </h5>
                <Input
                  style={{ width: "95%" }}
                  id="requestAmt"
                  type="date"
                  value={date}
                  onChange={(e) => setDate(e.target.value)}
                />
              </FormGroup>
              <FormGroup
                className="form-group-input"
                style={{ paddingLeft: 0 }}
              >
                <h5 style={{ fontSize: 14, width: 300 }}>
                  Planned Repayment Amount (₹)
                </h5>
                <Input
                  style={{ width: "95%" }}
                  id="disbursed_amt"
                  type="number"
                  value={disbursed_amt}
                  onChange={(e) => setDisbursement(e.target.value)}
                />
              </FormGroup>
            </ModalBody>
          ) : (
            <ModalBody>
              <FormGroup
                className="form-group-input"
                style={{ paddingLeft: 0 }}
              >
                <h5 style={{ fontSize: 14, width: 300 }}>
                  Planned Repayment Amount (₹)
                </h5>
                <Input
                  style={{ width: "95%" }}
                  id="requestAmt"
                  type="number"
                  value={trackAmt}
                  disabled
                />
              </FormGroup>
              <FormGroup
                className="form-group-input"
                style={{ paddingLeft: 0 }}
              >
                <h5 style={{ fontSize: 14, width: 300 }}>
                  Actual Repayment Amount (₹)
                </h5>
                <Input
                  style={{ width: "95%" }}
                  id="disbursed_amt"
                  type="number"
                  value={disbursed_amt}
                  onChange={(e) => setDisbursement(e.target.value)}
                />
              </FormGroup>
              <FormGroup
                className="form-group-input"
                style={{ paddingLeft: 0 }}
              >
                <h5 style={{ fontSize: 14, width: 300 }}>
                  Actual Repayment Date
                </h5>
                <Input
                  style={{ width: "95%" }}
                  id="disbursed_date"
                  type="date"
                  value={disbursed_date}
                  onChange={(e) => setDisbursedDate(e.target.value)}
                />
              </FormGroup>

              <FormGroup
                className="form-group-input"
                style={{ paddingLeft: 0 }}
              >
                <h5 style={{ fontSize: 14, width: 300 }}>Repayment Info</h5>
                <Input
                  style={{ width: "95%" }}
                  id="disbursement_txn_info"
                  type="textarea"
                  value={disbursement_txn_info}
                  onChange={(e) => setdisbursement_txn_info(e.target.value)}
                />
              </FormGroup>
            </ModalBody>
          )}
        </>
      )}
      {modal && (
        <AlertPopupNew
          toggle={toggle}
          handleOk={() => {
            toggle()
            // onApprove("closed", caseId);
          }}
          handleCancel={() => {
            toggle()
            // onApprove("closed", caseId);
          }}
          modal={modal}
          title={
            "Case can’t be closed if there are pending repayments to be made"
          }
        />
      )}
      <ModalFooter style={{ display: "flex", justifyContent: "space-between" }}>
        {!isTrack && (
          <Button color="info" outline size="md" onClick={() => data?.pending_repayment >0 ?toggle(): onApprove("closed", caseId)}>
            Close Case
          </Button>
        )}{" "}
        <Button
          size="md"
          color="primary"
          onClick={() => (isTrack ? setIsTrack(false) : toggleTrackWidget())}
        >
          Cancel
        </Button>{" "}
        {(isAddRow || isTrack) && (
          <Button size="md" color="primary" onClick={handleSave} disabled={(isTrack && !isAddRow && (!disbursed_date ||!disbursed_amt )) }>
            Save
          </Button>
        )}
      </ModalFooter>
    </Modal>
  );
};

export default TrackRepayment;
