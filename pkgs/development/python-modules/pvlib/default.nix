{ lib
, buildPythonPackage
, fetchPypi
, h5py
, numpy
, pandas
, pytestCheckHook
, pytest-mock
, pytest-remotedata
, pytest-rerunfailures
, pytest-timeout
, pythonOlder
, pytz
, requests
, requests-mock
, scipy
, setuptools
, setuptools-scm
, wheel
}:

buildPythonPackage rec {
  pname = "pvlib";
  version = "0.10.4";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi{
    inherit pname version;
    hash = "sha256-DF+ov+ixSjmjC/7+WmzwFksuvYKikSbbPZBqhNk5+HI=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [
    h5py
    numpy
    pandas
    pytz
    requests
    scipy
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-mock
    pytest-remotedata
    pytest-rerunfailures
    pytest-timeout
    requests-mock
  ];

  pythonImportsCheck = [
    "pvlib"
  ];

  meta = with lib; {
    homepage = "https://pvlib-python.readthedocs.io";
    description = "Simulate the performance of photovoltaic energy systems";
    changelog = "https://pvlib-python.readthedocs.io/en/v${version}/whatsnew.html";
    license = licenses.bsd3;
    maintainers = with maintainers; [ jluttine ];
  };
}
