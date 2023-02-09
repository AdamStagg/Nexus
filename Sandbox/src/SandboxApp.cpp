
#include <Nexus.h>

class ExampleLayer : public Nexus::Layer
{
public:
	ExampleLayer()
		: Layer("Example")
	{
	}

	void OnUpdate() override
	{
		NX_INFO("ExampleLayer::Update");
	}

	void OnEvent(Nexus::Event& event) override
	{
		NX_LOG("{0}", event);
	}
};

class Sandbox : public Nexus::Application
{
public:
	
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox() 
	{

	}


};


namespace Nexus
{
	NEXUS_API void print();

}

Nexus::Application* Nexus::CreateApplication()
{
	return new Sandbox();
}