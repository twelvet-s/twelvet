import { Space } from "antd";
import React from "react";

const TagList: React.FC<{
    value?: {
        key: string;
        label: string;
    }[];
    onChange?: (
        value: {
            key: string;
            label: string;
        }[],
    ) => void;
}> = ({ value }) => {

    return (
        <Space>
            {value}
        </Space>
    );
};

export default TagList;