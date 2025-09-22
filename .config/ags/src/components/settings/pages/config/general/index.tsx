import { Option } from 'src/components/settings/shared/Option';
import { Header } from 'src/components/settings/shared/Header';
import options from 'src/configuration';
import { Gtk } from 'astal/gtk3';

export const BarGeneral = (): JSX.Element => {
    return (
        <scrollable
            name={'General'}
            className="bar-theme-page paged-container"
            vscroll={Gtk.PolicyType.AUTOMATIC}
        >
            <box vertical>
                <Header title="通用配置" />
                <Option
                    opt={options.theme.font.name}
                    fontLabel={options.theme.font.label}
                    fontStyle={options.theme.font.style}
                    title="Font"
                    type="font"
                />
                <Option opt={options.theme.font.size} title="字体大小" type="string" />
                <Option
                    opt={options.theme.font.weight}
                    title="字体重量"
                    subtitle="100, 200, 300, etc."
                    type="number"
                    increment={100}
                    min={100}
                    max={900}
                />
                <Option
                    opt={options.dummy}
                    title="配置"
                    subtitle="警告: 导入的配置会覆盖现有配置哦!"
                    type="config_import"
                    exportData={{ filePath: CONFIG_FILE, themeOnly: false }}
                />
                <Option
                    opt={options.hyprpanel.restartAgs}
                    title="唤醒或监视器连接时重新启动ags"
                    subtitle="警告：禁用此选项可能会导致睡眠/监视器连接出现条形图问题。"
                    type="boolean"
                />
                <Option
                    opt={options.hyprpanel.restartCommand}
                    title="重启命令"
                    subtitle="重启时执行的命令。如果需要，请使用“-b busName”标志。"
                    type="string"
                />
                <Option
                    opt={options.hyprpanel.useLazyLoading}
                    title="延迟加载设置对话框"
                    subtitle={
                        '仅在首次打开时加载设置对话框，而不是在每次启动时加载。（需要重新启动)\n' +
                        '提高启动速度并减少内存使用，直到访问对话框。'
                    }
                    type="boolean"
                />
                <Option
                    opt={options.terminal}
                    title="终端"
                    subtitle="给'btop'之类使用"
                    type="string"
                />
                <Option
                    opt={options.tear}
                    title="Tearing Compatible"
                    subtitle="Switches overlays to 'top' layer for tearing compatibility."
                    type="boolean"
                />
                <Option
                    opt={options.menus.transition}
                    title="菜单转换"
                    type="enum"
                    enums={['none', 'crossfade']}
                />
                <Option
                    opt={options.menus.transitionTime}
                    title="菜单转换持续时间"
                    type="number"
                    min={0}
                    max={10000}
                    increment={25}
                />
                <Option opt={options.theme.bar.menus.enableShadow} title="启用阴影" type="boolean" />
                <Option
                    opt={options.theme.bar.menus.shadow}
                    title="菜单阴影"
                    subtitle="要求设置足够的边距来容纳阴影。"
                    type="string"
                />
                <Option
                    opt={options.theme.bar.menus.shadowMargins}
                    title="Menu Shadow Margins"
                    subtitle="Margins count mouse events as clicks 'inside' the menu."
                    type="string"
                />

                <Header title="Scaling" />
                <Option
                    opt={options.scalingPriority}
                    title="Scaling Priority"
                    type="enum"
                    enums={['both', 'gdk', 'hyprland']}
                />
                <Option
                    opt={options.theme.bar.scaling}
                    title="Bar"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.notification.scaling}
                    title="Notifications"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.osd.scaling}
                    title="OSD"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.dashboard.scaling}
                    title="Dashboard Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.dashboard.confirmation_scaling}
                    title="Confirmation Dialog"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.media.scaling}
                    title="Media Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.volume.scaling}
                    title="Volume Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.network.scaling}
                    title="Network Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.bluetooth.scaling}
                    title="Bluetooth Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.battery.scaling}
                    title="Battery Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.clock.scaling}
                    title="Clock Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.notifications.scaling}
                    title="Notifications Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.menu.power.scaling}
                    title="Power Menu"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.tooltip.scaling}
                    title="Tooltips"
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
                <Option
                    opt={options.theme.bar.menus.popover.scaling}
                    title="Popovers"
                    subtitle="e.g., Right click menu of system tray items."
                    type="number"
                    min={1}
                    max={100}
                    increment={5}
                />
            </box>
        </scrollable>
    );
};
