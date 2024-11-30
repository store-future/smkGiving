import React, { useEffect, useState } from "react";
import {
  Button,
  Form,
  FormGroup,
  Label,
  Input,
  Container,
  Card,
  CardBody,
  CardTitle,
  CardText,
  Alert,
} from "reactstrap";
import "../styles.scss";
import { useAuth } from "../../context/AuthContext";
import GoogleLoginButton from "../../components/GoogleLoginButton";
import { useNavigate } from "react-router-dom";
import { post } from "../../services/Api";
import { API_LOGIN, API_SOCIAL_LOGIN } from "../../services/ApiConstant";
import {jwtDecode} from "jwt-decode";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const { login } = useAuth();
  const [error, setError] = useState("");
  const [successMessage, setSuccessMessage] = useState("");
  const navigate = useNavigate();

  const handleEmailChange = (e) => {
    setEmail(e.target.value);
  };

  const handlePasswordChange = (e) => {
    setPassword(e.target.value);
  };


  useEffect(()=>{
    localStorage.removeItem('token');
    localStorage.removeItem("user_role");
  },[])

  const handleSubmit = async (e) => {
    e.preventDefault();
    setSuccessMessage("");
    setError("");

    if (!email || !password) {
      setError("Email and password are required.");
      return;
    }

    try {
      const response = await post(API_LOGIN, { username: email, password });
      if (response.Error) {
        setError(response?.Error);
      } else {
        setSuccessMessage("Login successful!");
        localStorage.setItem("token", response.token);
        localStorage.setItem("user_role", response?.user_role);
        navigate("/");
        window.location.reload();
      }
    } catch (error) {
      if (error.response && error.response.data && error.response.data.message === "Invalid email or password") {
        setError("Invalid email or password.");
      } else {
        setError("Something went wrong. Please try again later.");
      }
    }
  };

  const onSocialLogin = async (e) => {
    try {
      const token = e.credential;
      const decodedToken = jwtDecode(token);

      const response = await post(
        API_SOCIAL_LOGIN,
        {
          domain: "google",
          email: decodedToken?.email,
          token: e?.credential,
        },
        true
      );

      localStorage.setItem("token", response.token);
      localStorage.setItem("user_role", response?.user_role);
      setSuccessMessage(response.message);
      setError("");
      navigate("/");
    } catch (error) {
      setError("Something went wrong. Please try again later.");
    }
  };

  return (
      <Card className="card-login ">
        <CardBody className="login-card-body"></CardBody>
        <CardBody className="form-login">
          <CardTitle tag="h4" className="text-center">
            Hello! Welcome Back
          </CardTitle>
          <CardTitle tag="p" className="text-center">
            Log in with your credentials.
          </CardTitle>
          <br />
          {error && <Alert color="danger">{error}</Alert>}
          {successMessage && <Alert color="success">{successMessage}</Alert>}
          <br />
          <Form onSubmit={handleSubmit}>
            <FormGroup>
              <Label for="email" style={{ fontSize: 14 }}>
                Username
              </Label>
              <Input
                name="email"
                id="email"
                placeholder="Enter your email/phone"
                value={email}
                onChange={handleEmailChange}
                style={{fontSize:14,width:'100%'}}
              />
            </FormGroup>
            <FormGroup>
              <Label for="password" style={{ fontSize: 14, marginTop: 30, display: "flex", justifyContent: "space-between" }}>
                <div>Password</div>
                <a href="/forgot-password" style={{ fontSize: 13 }}>
                  Forgot Password?
                </a>
              </Label>
              <Input
                type="password"
                name="password"
                id="password"
                placeholder="Enter your password"
                value={password}
                onChange={handlePasswordChange}
                style={{fontSize:14,width:'100%'}}
              />
            </FormGroup>
            <Button type="submit" color="primary" className="login-btn mt-3">
              Login
            </Button>
          </Form>
          <br />
          <CardText className="text-center">Or</CardText>
          <div className="login-btn-social mt-3">
          <GoogleLoginButton onSuccess={(e) => onSocialLogin(e)} />
          </div>
        </CardBody>
      </Card>
  );
};

export default Login;
