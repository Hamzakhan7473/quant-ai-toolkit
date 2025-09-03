from setuptools import setup, find_packages

setup(
    name="quant-ai-toolkit",
    version="1.0.0",
    packages=find_packages(),
    install_requires=[
        "pandas>=2.0.0",
        "numpy>=1.24.0",
        "tensorflow>=2.13.0",
        "fastapi>=0.100.0",
        "yfinance>=0.2.18",
        "scikit-learn>=1.3.0",
    ],
    author="Quant-AI-Toolkit Team",
    description="AI-Powered Quantitative Trading Platform",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/your-username/quant-ai-toolkit",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Financial and Insurance Industry",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.9",
    ],
)
