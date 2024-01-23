
function [state, options, optchanged] = outFcn(options, state, flag)
    global parastring
    FileName = ['GenData_', parastring, '.mat'];
    if (exist(FileName)) == 2
        load(FileName);
        if state.Generation == 0
            iter = GenData.Generation;
        else
            iter = GenData.Generation + 1;
        end
    else
        iter = 1;
    end
    GenData.x(iter, :) = state.Population(1, :);
    GenData.Generation = iter;
    GenData.FunEval(iter, :) = state.FunEval;
    GenData.Population(:, :, iter) = state.Population;
    GenData.Score(:, iter) = state.Score;
    save(FileName, 'GenData');
    % standard template code follows
    optchanged = false;
    switch flag
    case 'init'
            disp('Starting the algorithm');
        case {'iter','interrupt'}
            disp('Iterating ...')
        case 'done'
            disp('Performing final task');
    end    % GAGenSave()