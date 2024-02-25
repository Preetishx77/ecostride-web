import { NumberField, Show, TextField } from "@refinedev/antd";
import { IResourceComponentsProps, useShow } from "@refinedev/core";
import { Col, Row, Typography } from "antd";
import React, { useEffect, useState } from "react";
import { useSearchParams } from "react-router-dom";

const { Title } = Typography;

export const CategoryShow: React.FC<IResourceComponentsProps> = () => {
  const [campaignData, setCampaignData] = useState(null);
  const [error, setError] = useState(null);
  const campaignIdMatch = window.location.pathname.match(/\/campaigns\/show\/([a-zA-Z0-9_-]+)/);
  const campaignId = campaignIdMatch ? campaignIdMatch[1] : null;

  useEffect(() => {
    const fetchCampaignData = async () => {
      try {
        if (!campaignId) {
          throw new Error("Campaign ID not found in URL");
        }

        const response = await fetch(`https://ecostride-backend.vercel.app/user/campaigns/${campaignId}`);
        const data = await response.json();

        setCampaignData(data.campaign);
      } catch (error) {
        setError(error);
      }
    };

    fetchCampaignData();
  }, []);

  // if (isLoading) {
  //   return <div>Loading...</div>;
  // }

  if (error) {
    return <div>Error: {error.message}</div>;
  }

  return (
    <Show isLoading={!campaignData} canDelete={false} canEdit={false}>
      <Row justify={"space-between"}>
<Col lg={12}>
<Title level={5}>{"Campaign ID"}</Title>
      <TextField value={campaignData?.campaignId ?? ""} />
      <Title level={5}>{"Campaign Name"}</Title>
      <TextField value={campaignData?.campaignName} />
      <Title level={5}>{"Organization Name"}</Title>
      <TextField value={campaignData?.orgName} />
      <Title level={5}>{"Latitude"}</Title>
      <TextField value={campaignData?.latitude} />
      <Title level={5}>{"Longitude"}</Title>
<TextField value={campaignData?.longitude} />
</Col>
<Col lg={12}>

      <Title level={5}>{"Total CO2 Sequestration"}</Title>
      <TextField value={campaignData?.Totalco2Sequestration} />
      <Title level={5}>{"Collected Amount"}</Title>
      <TextField value={campaignData?.collectedAmount} />
      <Title level={5}>{"Target Amount"}</Title>
      <TextField value={campaignData?.targetAmount} />
      <Title level={5}>{"Plants"}</Title>

      {campaignData?.plantdata?.map((plant, index) => (
    <div key={index}>
      <Row>
      <Title level={5}>{plant.name}</Title>
      <TextField value={plant.quantity}  style={{marginLeft: "10px"}}/>
      </Row>
    </div>
  ))}
</Col>
      </Row>

    </Show>
  );
};
