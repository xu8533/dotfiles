import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import AstalNotifd from 'gi://AstalNotifd?version=0.1';

const notifdService = AstalNotifd.get_default();

export const Placeholder = (): JSX.Element => {
    return (
        <box
            className={'notification-label-container'}
            halign={Gtk.Align.CENTER}
            valign={Gtk.Align.FILL}
            expand
        >
            <box valign={Gtk.Align.CENTER} vertical expand>
                <label
                    className={'placeholder-label dim bell txt-icon'}
                    label={bind(notifdService, 'dontDisturb').as((dnd) => (dnd ? '󰂛' : '󰂚'))}
                    valign={Gtk.Align.CENTER}
                />
                <label
                    className={'placeholder-label dim message'}
                    label={"无通知 :)"}
                    valign={Gtk.Align.START}
                />
            </box>
        </box>
    );
};
