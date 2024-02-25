import { Create, useForm } from "@refinedev/antd";
import { IResourceComponentsProps } from "@refinedev/core";
import { Form, Input, InputNumber, Button, Select, notification, Row, Col, Typography } from "antd";
import React, { useState } from "react";
import { treeData } from "../../utils/treeData";

const { Option } = Select;

export const CategoryCreate: React.FC<IResourceComponentsProps> = () => {
  const { formProps, saveButtonProps } = useForm({});
  const {Text} = Typography;

  const [plantFields, setPlantFields] = useState([{ name: "", quantity: 0, co2Sequestration: 0 }]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  
  const handleAddPlant = () => {
    setPlantFields([...plantFields, { name: "", quantity: 0, co2Sequestration: 0 }]);
  };

  const handleRemovePlant = (index: number) => {
    const updatedFields = [...plantFields];
    updatedFields.splice(index, 1);
    setPlantFields(updatedFields);
  };

  const handlePlantChange = (value: string, index: number) => {
    const updatedFields = [...plantFields];
    updatedFields[index].name = value;
    const plant = treeData.find((item) => item.type === value);
    updatedFields[index].co2Sequestration = parseInt(plant?.CO2);
    setPlantFields(updatedFields);
  };

  const handleQuantityChange = (value: number, index: number) => {
    const updatedFields = [...plantFields];
    updatedFields[index].quantity = value;
    setPlantFields(updatedFields);
  };

  const calculateTotalCO2 = () => {
    let totalCO2 = 0;
    plantFields.forEach((field) => {
      const plant = treeData.find((item) => item.type === field.name);
      console.log(plant);
      if (plant) {
        totalCO2 += plant.CO2 * field.quantity;
      }
    });
    return totalCO2;
  };

  const calculateTotalCarbonCredits = () => {
    const totalCo2 = calculateTotalCO2();
    return totalCo2 / 1000;
  };

  const openNotification = () => {
    notification.success({
      message: `Campaign create successful`,
      description: "Congratulations ! Your Eco Stride campaign is now created !",
      placement: 'topRight',
    });
  };

  const handleSubmit = async (formData: object) => {
    setIsLoading(true);
    setError(null);
    try {
        const formBody = { ...formData };

        formBody.donorList = [];
        formBody.collectedAmount = 0;
        formBody.completed = false;
        formBody.ngoId = "QNMcRkQ7Qwwz18puYXjv";
        formBody.plantdata = plantFields;
        formBody.Totalco2Sequestration = parseInt(calculateTotalCO2());
        formBody.CarbonCredits = parseInt(calculateTotalCarbonCredits());

        const response = await fetch("https://ecostride-backend.vercel.app/ngo/campaign/create", {
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
    <Create saveButtonProps={saveButtonProps}>
      <Form {...formProps} layout="vertical" onFinish={onFinish}>
        <Row justify={"space-between"}>
          <Col lg={11}>
          <Form.Item
          label={"Campaign Name"}
          name={["campaignName"]}
          rules={[{ required: true, message: "Please input the campaign name!" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"Organization Name"}
          name={["orgName"]}
          rules={[{ required: true, message: "Please input the organization name!" }]}
        >
          <Input />
        </Form.Item>

        {plantFields.map((field, index) => (
          <Form.Item label={"Plant Data"} key={index}>
            <Select
              style={{ width: "50%" }}
              value={field.plant}
              onChange={(value) => handlePlantChange(value, index)}
            >
              {treeData.map((plant) => (
                <Option key={plant.type} value={plant.type}>
                  {plant.type}
                </Option>
              ))}
            </Select>
            <InputNumber
              style={{ marginLeft: "1rem", width: "20%" }}
              value={field.quantity}
              onChange={(value) => handleQuantityChange(value, index)}
            />
            <Button onClick={() => handleRemovePlant(index)} style={{ marginLeft: "1rem" }}>
              Remove
            </Button>
          </Form.Item>
        ))}
                <Form.Item>
          <Button type="dashed" onClick={handleAddPlant} style={{ width: "100%" }}>
            Add Plant
          </Button>
        </Form.Item>

        <Form.Item
          label={"Target Amount"}
          name={["targetAmount"]}
          rules={[{ required: true, message: "Please input the target amount to be raised" }]}
        >
          <Input />
        </Form.Item>
          </Col>
          <Col lg={11}>
          <Form.Item
          label={"Organization Phone"}
          name={["orgPhone"]}
          rules={[{ required: true, message: "Please input the organization phone!" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"Latitude"}
          name={["latitude"]}
          rules={[{ required: true, message: "Please input the latitude!" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"Longitude"}
          name={["longitude"]}
          rules={[{ required: true, message: "Please input the longitude!" }]}
        >
          <Input />
        </Form.Item>
        <Form.Item label={"Total CO2 Sequestration (in KGs) "}>
          <Input value={calculateTotalCO2()} disabled />
        </Form.Item>
        <Form.Item label={"Total Carbon Credits ( 1 CC = 1000 KGs )"}>
          <Input value={calculateTotalCarbonCredits()} disabled />
        </Form.Item>
          </Col>
          <Text color="red" type="danger" style={{float: "right"}}>{error}</Text>
        </Row>



        

      </Form>
    </Create>
  );
};
