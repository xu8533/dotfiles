import { PlaybackDevices } from './PlaybackDevices.js';
import { InputDevices } from './InputDevices.js';
import { Header } from './Header.js';

export const AvailableDevices = (): JSX.Element => {
    return (
        <box vertical className={'menu-section-container playback'}>
            <Header type={'playback'} label={'播放设备'} />
            <PlaybackDevices />

            <Header type={'input'} label={'输入设备'} />
            <InputDevices />
        </box>
    );
};
