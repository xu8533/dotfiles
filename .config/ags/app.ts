import './src/lib/session';
import './src/style';
import 'src/core/behaviors/bar';
import { App } from 'astal/gtk3';
import { runCLI } from 'src/services/cli/commander';
import { InitializationService } from 'src/core/initialization';

App.start({
    instanceName: 'astal',
    requestHandler: (request: string, res: (response: unknown) => void) => runCLI(request, res),
    main: () => InitializationService.initialize(),
});
