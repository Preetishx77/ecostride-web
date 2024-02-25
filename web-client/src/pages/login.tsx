import { useLogin } from "@refinedev/core";
import { useEffect, useRef } from "react";

import { Col, Layout, Row, Space, Typography } from "antd";

import { CredentialResponse } from "../interfaces/google";

const GOOGLE_CLIENT_ID =
  "768241231224-1sobuordm4lp3vpj98377flm1tsc22gl.apps.googleusercontent.com";

export const Login: React.FC = () => {
  const { mutate: login } = useLogin<CredentialResponse>();

  const { Title } = Typography;
  const GoogleButton = (): JSX.Element => {
    const divRef = useRef<HTMLDivElement>(null);

    useEffect(() => {
      if (typeof window === "undefined" || !window.google || !divRef.current) {
        return;
      }

      try {
        window.google.accounts.id.initialize({
          ux_mode: "popup",
          client_id: GOOGLE_CLIENT_ID,
          callback: async (res: CredentialResponse) => {
            if (res.credential) {
              login(res);
            }
          },
        });
        window.google.accounts.id.renderButton(divRef.current, {
          theme: "outline",
          size: "large",
          type: "standard",
          logo_alignment: "center",
          width: "350"
        });
      } catch (error) {
        console.log(error);
      }
    }, []);

    return <div ref={divRef} />;
  };

  return (
    <Layout
      style={{
        height: "100vh",
        justifyContent: "center",
        alignItems: "center",
        backgroundColor: "#D2E3C8",
      }}
    >
        <Row justify={"center"} align={"middle"} color="white" style={{
          height: "40vh",
          width: "50vw",
          minHeight: "400px",
          minWidth: "300px",
          backgroundColor: "white",
          borderRadius: 12
        }}>
          <Col>
          <div style={{
            display: 'flex',
            flexDirection: 'row',
            justifyContent: "center",
            marginBottom: "20px"
          }}>
          <iframe src="https://lottie.host/embed/434a403e-ad70-4f07-8a02-65e7fc44c5af/Mm0VqFKfQs.json" seamless={true} style={{
            border: "none"
          }}></iframe>

          </div>
          <Title style={{
            color: "#4F6F52",
            textAlign: "center"
          }}>Eco Stride</Title>
          <Space direction="vertical">
          <GoogleButton />

          </Space>
          </Col>


        </Row>
    </Layout>
  );
};
