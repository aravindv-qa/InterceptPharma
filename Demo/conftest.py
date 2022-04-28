import pytest as pytest


@pytest.fixture(scope="class")
def setup():
    print("Demo first")
    yield
    print("Demo last")


@pytest.fixture()
def dataloads():
    print("Demo first")
    return ["Test", "te"]


@pytest.fixture(params=["Chrome", "IE"])
def crossbrowser(request):
    return request.param
