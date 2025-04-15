import AstalNetwork from 'gi://AstalNetwork?version=0.1';

type DeviceSate = AstalNetwork.DeviceState;
type DevceStates = {
    [key in DeviceSate]: string;
};

export const DEVICE_STATES: DevceStates = {
    [AstalNetwork.DeviceState.UNKNOWN]: '未知',
    [AstalNetwork.DeviceState.UNMANAGED]: '未管理',
    [AstalNetwork.DeviceState.UNAVAILABLE]: '不可用',
    [AstalNetwork.DeviceState.DISCONNECTED]: '连接断开',
    [AstalNetwork.DeviceState.PREPARE]: '准备',
    [AstalNetwork.DeviceState.CONFIG]: '配置',
    [AstalNetwork.DeviceState.NEED_AUTH]: '需要认证',
    [AstalNetwork.DeviceState.IP_CONFIG]: 'IP Configuration',
    [AstalNetwork.DeviceState.IP_CHECK]: 'IP Check',
    [AstalNetwork.DeviceState.SECONDARIES]: 'Secondaries',
    [AstalNetwork.DeviceState.ACTIVATED]: '活动',
    [AstalNetwork.DeviceState.DEACTIVATING]: '未活动',
    [AstalNetwork.DeviceState.FAILED]: '失败',
};
