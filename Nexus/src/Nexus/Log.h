#pragma once

#include "spdlog/spdlog.h"
#include "Core.h"
#include <memory.h>

namespace Nexus
{

	class NEXUS_API Log
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; };
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; };

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

//Core log macros
#define NX_CORE_TRACE(...)		::Nexus::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define NX_CORE_DEBUG(...)		::Nexus::Log::GetCoreLogger()->debug(__VA_ARGS__)
#define NX_CORE_INFO(...)		::Nexus::Log::GetCoreLogger()->info(__VA_ARGS__)
#define NX_CORE_WARN(...)		::Nexus::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define NX_CORE_ERROR(...)		::Nexus::Log::GetCoreLogger()->error(__VA_ARGS__)
#define NX_CORE_CRITICAL(...)	::Nexus::Log::GetCoreLogger()->critical(__VA_ARGS__)

//Client log macros
#define NX_TRACE(...)	::Nexus::Log::GetClientLogger()->trace(__VA_ARGS__)
#define NX_DEBUG(...)	::Nexus::Log::GetClientLogger()->debug(__VA_ARGS__)
#define NX_INFO(...)		::Nexus::Log::GetClientLogger()->info(__VA_ARGS__)
#define NX_WARN(...)		::Nexus::Log::GetClientLogger()->warn(__VA_ARGS__)
#define NX_ERROR(...)	::Nexus::Log::GetClientLogger()->error(__VA_ARGS__)
#define NX_CRITICAL(...) ::Nexus::Log::GetClientLogger()->critical(__VA_ARGS__)
