import { Create, Show, TextField, useForm } from "@refinedev/antd";
import { IResourceComponentsProps, useGetIdentity } from "@refinedev/core";
import { Col, Form, Input, Row, Select, Space, Typography, notification } from "antd";
import axios from "axios";
import React, { useEffect, useState } from "react";

type IUser = {
    id: number;
    name: string;
    avatar: string;
};

const CreateNGO: React.FC<IResourceComponentsProps> = () => {
    const { Title } = Typography;
    const [isLoading, setIsLoading] = useState(false);
    const { data: user } = useGetIdentity<IUser>();
    const [profile, setProfile] = useState({});
    const fetchData = async () => {
        try {
          setIsLoading(true);
          const response = await fetch('https://ecostride-backend.vercel.app/ngo/user', {
            method: "POST",
            headers: {
                "access-Control-Allow-Origin": "true",
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                email: user?.email
            }),
        });
          const data = await response.json();
          console.log(data.message);
          if(response.status === 200){
            setProfile(data.message);
          }
        } catch (error) {
          console.error('Error fetching data:', error);
        } finally {
          setIsLoading(false);
        }
      };

    useEffect(() => {
      fetchData();
    }, [user?.email]);

    const { formProps, saveButtonProps } = useForm({});
    const {Text} = Typography;
    const [error, setError] = useState(null);

    
    const openNotification = () => {
      notification.success({
        message: `NGO Sign Up successful`,
        description: "Congratulations ! Your NGO Sign UP is successful and you are now eligible to create Eco Stride campaigns",
        placement: 'topRight',
      });
    };

    const handleSubmit = async (formData: object) => {
        setIsLoading(true);
        setError(null);
        try {
            const formBody = { ...formData };

            formBody.verified = true;
            formBody.email = user.email;

            const response = await fetch("https://ecostride-backend.vercel.app/ngo/signup", {
                method: "POST",
                headers: {
                    "access-Control-Allow-Origin": "true",
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(formBody),
            });

            if (!response.ok) {
                throw new Error(response.message || "Failed to submit data");
            }else{
                openNotification();
                fetchData();
            }
            console.log(response, "Data submitted successfully");
        } catch (error) {
            setError(error?.toString());
            console.error("Error:", error);
        } finally {
            setIsLoading(false);
        }
    };


    const onFinish = (values: object) => {
        handleSubmit(values);
        // You can perform further operations with the form values here
    };

    return (
        Object.keys(profile)?.length === 0 ? 
        <Create saveButtonProps={saveButtonProps} isLoading={isLoading}>
            <Form {...formProps} layout="vertical" onFinish={onFinish}>
                <Row justify="space-between">
                    <Col lg={10}>
                        <Form.Item
                            label={"Name"}
                            name="name"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the name!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>

                        <Form.Item
                            label={"Registration Number"}
                            name="registrationNumber"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the registration number!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                        <Form.Item label="Address">
                            <Form.Item
                                name={['address', 'city']}
                            >
                                <Input placeholder="City" />
                            </Form.Item>
                            <Space />

                            <Form.Item
                                name={['address', 'state']}
                            >
                                <Input placeholder="State" />
                            </Form.Item>
                            <Space direction="vertical" />

                            <Form.Item
                                name={['address', 'country']}
                            >
                                <Input placeholder="Country" />
                            </Form.Item>
                            <Space />

                            <Form.Item
                                name={['address', 'pincode']}
                                noStyle
                            >
                                <Input placeholder="Pincode" />
                            </Form.Item>
                            <Space />
                        </Form.Item>


                    </Col>
                    <Col lg={10}>
                        <Form.Item
                            label={"Organization Category"}
                            name="orgCategory"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the organization category!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                        <Form.Item
                            label={"Name of Point of Contact"}
                            name="namePOC"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the name of point of contact!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>

                        <Form.Item
                            label={"Phone of Point of Contact"}
                            name="phonePOC"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the phone of point of contact!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>

                        <Form.Item
                            label={"Association"}
                            name="association"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the association!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>

                        <Form.Item


                            label={"Aadhar of Point of Contact"}
                            name="addharPOC"
                            rules={[
                                {
                                    required: true,
                                    message: 'Please input the Aadhar of point of contact!',
                                },
                            ]}
                        >
                            <Input />
                        </Form.Item>
                    </Col>
                </Row>



            </Form>
            <Text color="red" type="danger" style={{float: "right"}}>{error}</Text>
        </Create>
        : <>
        <Show isLoading={!profile} canDelete={false} canEdit={false} goBack={false} headerButtons={false}>
        <Row justify={"space-between"}>
            <Col lg={12}>
            <Title level={5}>{"Email"}</Title>
  <TextField value={profile?.email ?? ""} />
  <Title level={5}>{"Name of Point of Contact"}</Title>
  <TextField value={profile?.namePOC} />
  <Title level={5}>{"Phone of Point of Contact"}</Title>
  <TextField value={profile?.phonePOC} />
  <Title level={5}>{"Organization Category"}</Title>
  <TextField value={profile?.orgCategory} />
  <Title level={5}>{"Association"}</Title>
  <TextField value={profile?.association} />
  <Title level={5}>{"Registration Number"}</Title>
  <TextField value={profile?.registrationNumber} />
  <Title level={5}>{"City"}</Title>
  <TextField value={profile?.address?.city} />
            </Col>
            <Col lg={12}>
            <Title level={5}>{"Pincode"}</Title>
  <TextField value={profile?.address?.pincode} />
  <Title level={5}>{"Country"}</Title>
  <TextField value={profile?.address?.country} />
  <Title level={5}>{"State"}</Title>
  <TextField value={profile?.address?.state} />
  <Title level={5}>{"Organization Name"}</Title>
  <TextField value={profile?.name} />
  <Title level={5}>{"Status"}</Title>
  <TextField value={profile?.verified ? "Verified" : "Not Verified"} />
  <Title level={5}>{"Aadhar of Point of Contact"}</Title>
  <TextField value={profile?.addharPOC} />
            </Col>
        </Row>


</Show>
</>
    );
};

export default CreateNGO;
