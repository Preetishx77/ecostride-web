import {
  DeleteButton,
  EditButton,
  List,
  ShowButton,
  useTable,
} from "@refinedev/antd";
import { BaseRecord, IResourceComponentsProps } from "@refinedev/core";
import { Space, Table } from "antd";
import React, { useEffect, useState } from "react";

export const CategoryList: React.FC<IResourceComponentsProps> = () => {

  const [campaigns, setCampaigns] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setIsLoading(true);
        const response = await fetch('https://ecostride-backend.vercel.app/user/campaigns');
        const data = await response.json();
        
        // Restructure data with keys as id and title
        const formattedData = data.campaigns.map(campaign => ({
          id: campaign.documentId,
          title: campaign.campaignName
        }));

        setCampaigns(formattedData);
      } catch (error) {
        console.error('Error fetching data:', error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchData();
  }, []);

  const { tableProps } = useTable({
    syncWithLocation: true,
    hasPagination: false,
    queryOptions: {
    }
  });

  console.log(tableProps);

  return (
    <List>
      <Table  dataSource={campaigns } rowKey="id" loading={isLoading}>
        <Table.Column dataIndex="id" title={"ID"} />
        <Table.Column dataIndex="title" title={"title"} />
        <Table.Column
          title={"Actions"}
          dataIndex="actions"
          render={(_, record: BaseRecord) => (
            <Space>
              <ShowButton hideText size="small" recordItemId={record.id} />
            </Space>
          )}
        />
      </Table>
    </List>
  );
};
