import AstalNetwork from 'gi://AstalNetwork?version=0.1';

export type WifiIcon = '󰤩' | '󰤨' | '󰤪' | '󰤨' | '󰤩' | '󰤮' | '󰤨' | '󰤥' | '󰤢' | '󰤟' | '󰤯' | '󰤫';

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
    [AstalNetwork.DeviceState.NEED_AUTH]: '需要验证',
    [AstalNetwork.DeviceState.IP_CONFIG]: 'IP配置',
    [AstalNetwork.DeviceState.IP_CHECK]: 'IP检查',
    [AstalNetwork.DeviceState.SECONDARIES]: 'Secondaries',
    [AstalNetwork.DeviceState.ACTIVATED]: '启用',
    [AstalNetwork.DeviceState.DEACTIVATING]: '禁用',
    [AstalNetwork.DeviceState.FAILED]: '失败',
} as const;

export const wifiIconMap = new Map<string, WifiIcon>([
    ['network-wireless-acquiring', '󰤩'],
    ['network-wireless-connected', '󰤨'],
    ['network-wireless-encrypted', '󰤪'],
    ['network-wireless-hotspot', '󰤨'],
    ['network-wireless-no-route', '󰤩'],
    ['network-wireless-offline', '󰤮'],
    ['network-wireless-signal-excellent', '󰤨'],
    ['network-wireless-signal-good', '󰤥'],
    ['network-wireless-signal-ok', '󰤢'],
    ['network-wireless-signal-weak', '󰤟'],
    ['network-wireless-signal-none', '󰤯'],
]);

export const AP_FLAGS = {
    NONE: 0,
    PRIVACY: 1,
} as const;
