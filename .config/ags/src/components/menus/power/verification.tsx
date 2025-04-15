import PopupWindow from '../shared/popup/index.js';
import powermenu from './helpers/actions.js';
import { App, Gtk } from 'astal/gtk3';
import { bind } from 'astal';

export default (): JSX.Element => (
    <PopupWindow name="verification" transition="crossfade" layout={'center'}>
        <box className="verification" expand={false}>
            <box className="verification-content" expand vertical>
                <box className="text-box" vertical>
                    <label className="title" label={bind(powermenu, 'title').as((t) => t.toUpperCase())} />
                    <label
                        className="desc"
                        label={bind(powermenu, 'title').as((p) => `请问确认 ${p.toLowerCase()}?`)}
                    />
                </box>
                <box className="buttons horizontal" vexpand valign={Gtk.Align.END} homogeneous>
                    <button className="verification-button bar-verification_yes" onClicked={powermenu.exec}>
                        <label label={'是'} />
                    </button>
                    <button
                        className="verification-button bar-verification_no"
                        onClicked={() => App.toggle_window('verification')}
                    >
                        <label label={'否'} />
                    </button>
                </box>
            </box>
        </box>
    </PopupWindow>
);
