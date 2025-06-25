
#include <iostream>
#include "velox/buffer/Buffer.h"
#include "velox/common/memory/Memory.h"

namespace velox = facebook::velox;

int main() {
    velox::memory::MemoryManager::Options options;
    velox::memory::MemoryManager::initialize(options);
    auto pool = velox::memory::memoryManager()->addLeafPool();

    auto values = velox::AlignedBuffer::allocate<int64_t>(100, pool.get());
    auto nulls = velox::AlignedBuffer::allocate<bool>(100, pool.get());

    return 0;
}