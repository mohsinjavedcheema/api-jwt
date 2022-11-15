FROM 786661668075.dkr.ecr.us-east-1.amazonaws.com/nginx:1.23.2-alpine
ENV NODE_ENV production
# Copy built assets from builder
# Add your nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
# Expose port
EXPOSE 4001
# Start nginx
CMD ["nginx", "-g", "daemon off;"]
