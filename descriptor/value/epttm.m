function  epttm(p,a)
       T = length(p.all_trading_dates );
       N = length(p.stk_codes);          
       tgt_tag = 'epttm';  
       tgt_file =  [a.output_data_path,'\',tgt_tag ,'.h5'];
       [S,epttm] =  check_exist(tgt_file,['/',tgt_tag],p,T,N);
       
       if  S>0
           value = [a.input_data_path,'\DB\wind\AShareTTMHis.NET_PROFIT_PARENT_COMP_TTM.h5'];  
           tags = '/stk_code';
           tagn = '/NET_PROFIT_PARENT_COMP_TTM';
           tagr = '/report_period';

           X = load_single_value(S,T,N,p,value,tags,tagn,tagr);
           total_capital = h5read([a.input_data_path,'\fdata\base_data\capital.h5'],'/total_capital')';
           epttm(S:T,:) = X(S:T,:)./total_capital(S:T,:)*10000;

           if  exist(tgt_file,'file')==2
               eval(['delete ',tgt_file]);
           end
           eval(['hdf5write(tgt_file, ''date'',p.all_trading_dates_, ''stk_code'',p.stk_codes_,' '''',tgt_tag, ''',','' tgt_tag, ');']);  
       end
end