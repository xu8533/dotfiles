import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import { uptime } from 'src/lib/variables.js';
import { renderUptime } from './helpers';

export const PowerProfileHeader = (): JSX.Element => {
    return (
        <box className="menu-label-container" halign={Gtk.Align.FILL}>
            <label className="menu-label" label="电源配置" halign={Gtk.Align.START} hexpand />
            <label className="menu-label uptime" label={bind(uptime).as(renderUptime)} tooltipText="开机时间" />
        </box>
    );
};
