function display(v,varargin)
% standard output


displayClass(v,inputname(1),...
  'moreInfo',char(v.refSystem,'compact'),varargin{:});

if length(v) ~= 1, disp([' size: ' size2str(v)]);end

if v.antipodal, disp(' antipodal: true'); end

% display resolution 
if isOption(v,'resolution')
  disp([' resolution: ',xnum2str(getOption(v,'resolution')/degree),mtexdegchar]);
  v.opt = rmfield(v.opt,'resolution');
end

% display all other options
disp(char(dynOption(v)));

% display coordinates
if ~check_option(varargin,'skipCoordinates') && ...
    (check_option(varargin,'all') || (length(v) < 20 && ~isempty(v)))
  
  d = [v.x(:),v.y(:),v.z(:)];
  d(abs(d) < 1e-10) = 0;
  
  cprintf(d,'-L','  ','-Lc',{'x' 'y' 'z'});
end
