import React, { useEffect, useState } from 'react';
import { Button, Modal, ModalHeader, ModalBody, ModalFooter, Form, FormGroup, Label, Input } from 'reactstrap';
import { get, post, put } from '../../services/Api';
import { API_CASE_ANS_QUERY, API_CASE_DETAILS, API_CASE_QUERY } from '../../services/ApiConstant';

const QueryPopup = ({isOpen,toggleQuery,caseId,isAnswer}) => {
  const [query, setQuery] = useState('');
  const [data, setData] = useState([]);
  const [initialData, setInitialData] = useState([])
  const [isButtonDisabled, setIsButtonDisabled] = useState(true);


  const handleInputChange = (e) => {
    setQuery(e.target.value);
  };

  const handleSubmit = async(e) => {
    e.preventDefault();
    try {
      if(isAnswer){
        // const response = await put(API_CASE_ANS_QUERY+caseId+"/", { question_text:query,state:'close' });
        console.log("response====",data)
      }
      else{
        const response = await put(API_CASE_QUERY+caseId+"/", { question_text:query,state:'close' });
        console.log("response====",response)
      }
      
        toggleQuery();
        // Perform actions after successful login, such as setting tokens in local storage, etc.
      } catch (error) {
  
      }
  };

  useEffect(() => {
    const allFilled = data?.every((item) => item?.answer_text?.trim() !== '');
    setIsButtonDisabled(!allFilled);
  }, [data]);

  useEffect(()=>{
    if(isOpen){
      setQuery('')
    }
  },[isOpen])



  useEffect(()=>{
    if(isAnswer){
      getCaseDetails()
    }
  },[isAnswer])



  const getCaseDetails = async () => {
    const response = await get(
      API_CASE_DETAILS +
        "?case_id=" +
        caseId
    );

    console.log("response===",response)
    // hideLoader();
    setInitialData(response?.case_query || [])
    setData(response?.case_query || []);
    // window.scrollTo(0, 0);
  };

  const handleInputChangeNew = (id, text) => {
    setData((prevData) =>
      prevData.map((item) =>
        item.id === id ? { ...item, answer_text: text } : item
      )
    );
  };

  return (
    <div>
   
      <Modal isOpen={isOpen} toggle={toggleQuery}>
        <ModalHeader toggle={toggleQuery}>{isAnswer?"Answer":"Ask"} Your Query : Case {caseId}</ModalHeader>
        <ModalBody>
          <Form onSubmit={handleSubmit}>
           {data?.length> 0 ? ( 
            <>
           {data.map((itm) => (
        <FormGroup key={itm.id}>
          <Label for={`userQuery-${itm.id}`}>{itm.question_text}?</Label>
          <Input
            type="textarea"
            name="query"
            id={`userQuery-${itm.id}`}
            style={{ width: '95%' }}
            placeholder="Type your answer here..."
            value={itm.answer_text}
            onChange={(e) => handleInputChangeNew(itm.id, e.target.value)}
          />
        </FormGroup>
      ))}
            </>
            ):(
              <FormGroup>
              <Label for="userQuery">Your Query</Label>
              <Input
                type="textarea"
                name="query"
                id="userQuery"
                style={{width:'95%'}}
                placeholder={isAnswer?"Type your answer here...":"Type your query here..."}
                value={query}
                onChange={handleInputChange}
              />
            </FormGroup>
            )}
          </Form>
        </ModalBody>
        <ModalFooter>
          <Button color="secondary" onClick={toggleQuery}>Cancel</Button>
        {isAnswer ?(
           <Button color="primary" disabled={isButtonDisabled} onClick={handleSubmit}>Submit</Button>

        ):(  <Button color="primary" disabled={!query?.trim()} onClick={handleSubmit}>Submit</Button>)}

        </ModalFooter>
      </Modal>
    </div>
  );
};

export default QueryPopup;
