#include "nxpch.h"
#include "Log.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Nexus
{
	std::shared_ptr<spdlog::logger> Log::s_CoreLogger;
	std::shared_ptr<spdlog::logger> Log::s_ClientLogger;

	void Log::Init()
	{
		spdlog::set_pattern("%^[%T] %n: %v%$");

		s_CoreLogger = spdlog::stdout_color_mt("NEXUS");
		s_CoreLogger->set_level(spdlog::level::trace);
		NX_CORE_LOG("Initialized Nexus Log");

		s_ClientLogger = spdlog::stdout_color_mt("APP");
		s_ClientLogger->set_level(spdlog::level::trace);
		NX_LOG("Initialized Client Log");
	}
}