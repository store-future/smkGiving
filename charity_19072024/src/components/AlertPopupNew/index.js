import React, { useState } from 'react';
import {
  Button, Modal, ModalHeader, ModalBody, ModalFooter
} from 'reactstrap';

const AlertPopupNew = ({title,handleOk,toggle,modal,handleCancel,isRejected}) => {
  

//   const toggle = () => setModal(!modal);

//   const handleOk = () => {
//     // Handle OK button click
//     console.log('OK clicked');
//     setModal(false);
//   };

//   const handleCancel = () => {
//     // Handle Cancel button click
//     console.log('Cancel clicked');
//     setModal(false);
//   };

  return (
    <div>
      {/* <Button color="danger" onClick={toggle}>
        Open Alert
      </Button> */}
      <Modal isOpen={modal} toggle={toggle}>
        <ModalHeader toggle={toggle}>
          Alert
        </ModalHeader>
        <ModalBody>
          {title}
        </ModalBody>
       {isRejected ?(
         <ModalFooter>
             <Button color="secondary" onClick={handleCancel}>
         Do not reject
         </Button>
         <Button color="primary" onClick={handleOk}>
         Reject
         </Button>
      
       </ModalFooter>
       ):(

<ModalFooter>
<Button color="primary" onClick={handleOk}>
  OK
</Button>
<Button color="secondary" onClick={handleCancel}>
  Cancel
</Button>
</ModalFooter>

       )}
      </Modal>
    </div>
  );
};

export default AlertPopupNew;
