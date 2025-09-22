import { ActionButton } from './ActionButton';
import AstalBluetooth from 'gi://AstalBluetooth?version=0.1';
import { forgetBluetoothDevice } from '../helpers';
import { isPrimaryClick } from 'src/lib/events/mouse';

export const ForgetButton = ({ device }: ForgetButtonProps): JSX.Element => {
    return (
        <ActionButton
            name={'delete'}
            tooltipText={'删除'}
            label={'󰆴'}
            onClick={(_, self) => {
                if (isPrimaryClick(self)) {
                    forgetBluetoothDevice(device);
                }
            }}
        />
    );
};

interface ForgetButtonProps {
    device: AstalBluetooth.Device;
}
