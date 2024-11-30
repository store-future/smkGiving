import React from 'react';
import { Modal, Carousel } from 'react-bootstrap';
import { FILE_BASE_URL } from '../../services/ApiConstant';

const ImageCarouselModal = ({ show, handleClose, image }) => {
  return (
    <Modal show={show} onHide={handleClose} size="lg" centered>
      <Modal.Header closeButton>
        <Modal.Title>Attachment</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Carousel>
          {/* {images.map((image, index) => ( */}
            <Carousel.Item >
              <img
                className="d-block w-100"
                src={FILE_BASE_URL+ image}
                alt={"doc"}
              />
              {/* <Carousel.Caption>
                <p>{image.caption}</p>
              </Carousel.Caption> */}
            </Carousel.Item>
          {/* ))} */}
        </Carousel>
      </Modal.Body>
    </Modal>
  );
};

export default ImageCarouselModal;
