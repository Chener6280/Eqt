function  cal_nm(p,a,K0,K1,K2,K3,K4,K5,K6)

      [~,qe,d1]     = get_rpt_table('AShareIncome', 'NET_PROFIT_EXCL_MIN_INT_INC',1,a.input_data_path,p.stk_codes_);
      [~,qasset,d2] = get_rpt_avg_table('AShareIncome', 'OPER_REV', 1,a.input_data_path,p.stk_codes_);
      [~,ia,ib] = intersect(d1,d2);
      d = d1(ia);
      e_q = qe(ia,:);
      asset_q  = qasset(ib,:);
      q  = e_q./asset_q;
%%
%     
%      K0 = 4; % 同比 
%      K1 = 8; % 短稳定性
%      K2 = 16;  % 长稳定性
%      K3 = 12;% 长期均值　
%      K4 = 8;%  加速度　
%      K5 = 20; % 回归
%      K6 = 8; % 二次项

     get_fundmental_stats(p,a,q,d,K0,K1,K2,K3,K4,K5,K6,'nm');
end