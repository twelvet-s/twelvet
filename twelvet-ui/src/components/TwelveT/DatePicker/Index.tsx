import React, { FC } from 'react';
import { DatePicker as DatePickerAntd } from 'antd';
import { DatePickerProps } from "antd/es/date-picker";
import moment from "moment";

const DatePicker: FC<DatePickerProps> = props => {
    const { value, defaultValue, ...rest } = props;
    const dateValue = value && moment(value);
    const defaultDateValue = defaultValue && moment(defaultValue);
    return <DatePickerAntd value={dateValue} defaultValue={defaultDateValue} {...rest} />;
};
export default DatePicker